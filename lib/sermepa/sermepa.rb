require 'active_support/core_ext'
require 'sermepa/constants'
require 'sermepa/errors'
require 'sermepa/signature'
require 'savon'

module Sermepa

  def build_values(params, transaction_type)
    values = {
      DS_MERCHANT_MERCHANTCODE:     params[:merchant_code] || Sermepa.config.merchant_code,
      DS_MERCHANT_CURRENCY:         CURRENCIES[params[:currency] || Sermepa.config.currency],
      DS_MERCHANT_TERMINAL:         params[:terminal] || Sermepa.config.terminal,
      DS_MERCHANT_AMOUNT:           (params[:amount].to_f * 100).to_i.to_s,
      DS_MERCHANT_ORDER:            params[:order].to_s,
      DS_MERCHANT_TRANSACTIONTYPE:  TRANSACTION_TYPES[transaction_type]
    }
    values[:DS_MERCHANT_MERCHANTURL] = Sermepa.config.merchant_url if Sermepa.config.merchant_url

    values
  end

  def pay_request(params)
    values = build_values(params, :traditional_payment)
    values[:DS_MERCHANT_PAN] =        params[:pan]
    values[:DS_MERCHANT_CVV2] =       params[:cvv2]
    values[:DS_MERCHANT_EXPIRYDATE] = params[:expiration]

    values[:DS_MERCHANT_MERCHANTSIGNATURE] = signature(values)
    call(values)
  end

  def confirmation_request(params)
    values = build_values(params, :confirmation)

    values[:DS_MERCHANT_MERCHANTSIGNATURE] = signature(values)
    call(values)
  end

  def refund_request(params)
    values = build_values(params, :automatic_refund)

    values[:DS_MERCHANT_MERCHANTSIGNATURE] = signature(values)
    call(values)
  end

  def call(values = {})
    client = ::Savon.client(config.service_url)

    response = client.request :trata_peticion do
      soap.body do |xml|
        request_xml = values.to_xml(root: :DATOSENTRADA, dasherize: false, skip_instruct: true)
        xml.DATOSENTRADA(request_xml)

      end
    end

    result = Hash.from_xml response.to_hash[:trata_peticion_response][:trata_peticion_return]
    error_code = result['RETORNOXML']['CODIGO'].to_sym
    remote_error = error_code != :'0'

    if remote_error
      config._logger.warn("[Sermepa] Remote Error (#{error_code}): #{ERRORS[error_code]}")
      if config.raise_errors
        raise SermepaRemoteError.new(error_code)
      else
        return error_code
      end
    end

    response_code = result['RETORNOXML']['OPERACION']['Ds_Response']

    unless (0..99).include?(response_code.to_i) || response_code.to_i == 900
      if config.raise_errors
        raise SermepaPaymentError.new(response_code.to_sym)
      else
        return response_code.to_sym
      end
    end

    return false # No errors
  end
end
