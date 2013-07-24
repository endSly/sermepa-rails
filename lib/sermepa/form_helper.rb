module Sermepa
  module FormHelper
    def sermepa_payment_form(amount, params = {}, &block)
      values = {
        DS_MERCHANT_AMOUNT:                 (amount.to_f * 100).to_i,
        DS_MERCHANT_CURRENCY:               CURRENCIES[params[:currency]      || Sermepa.config.currency],
        DS_MERCHANT_PRODUCTDESCRIPTION:     params[:description],
        DS_MERCHANT_TITULAR:                params[:titular],
        DS_MERCHANT_ORDER:                  params[:order]                    || Time.now.to_i,
        DS_MERCHANT_MERCHANTCODE:           params[:merchant_code]            || Sermepa.config.merchant_code,
        DS_MERCHANT_TERMINAL:               params[:terminal]                 || Sermepa.config.terminal,
        DS_MERCHANT_TRANSACTIONTYPE:        TRANSACTION_TYPES[params[:transaction_type]],
        DS_MERCHANT_MERCHANTURL:            params[:merchant_url]             || Sermepa.config.merchant_url,
        DS_MERCHANT_URLOK:                  params[:url_ok]                   || Sermepa.config.url_ok,
        DS_MERCHANT_URLKO:                  params[:url_ko]                   || Sermepa.config.url_ko,
        DS_MERCHANT_CONSUMERLANGUAGE:       params[:consumer_language]        || Sermepa.config.consumer_language
      }
      values[:DS_MERCHANT_MERCHANTSIGNATURE] = Sermepa::signature(values)

      output = ActiveSupport::SafeBuffer.new
      form_tag Sermepa.config.post_url do
        output = ActiveSupport::SafeBuffer.new
        values.each_pair do |k,v|
          output << hidden_field_tag(k, v) if v
        end
        if block_given?
          output << capture(&block)
        else
          output << submit_tag(t 'send')
        end
      end

    end
  end
end