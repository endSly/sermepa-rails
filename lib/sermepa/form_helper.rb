module Sermepa
  module FormHelper
    def build_sermepa_values(amount, params = {})
      values = {
        DS_MERCHANT_AMOUNT:                 (amount.to_f * 100).to_i,
        DS_MERCHANT_CURRENCY:               CURRENCIES[params[:currency]      || config.currency],
        DS_MERCHANT_PRODUCTDESCRIPTION:     params[:description],
        DS_MERCHANT_TITULAR:                params[:titular],
        DS_MERCHANT_ORDER:                  params[:order]                    || Time.now.to_i,
        DS_MERCHANT_MERCHANTCODE:           params[:merchant_code]            || config.merchant_code,
        DS_MERCHANT_TERMINAL:               params[:terminal]                 || config.terminal,
        DS_MERCHANT_TRANSACTIONTYPE:        TRANSACTION_TYPES[params[:transaction_type]],
        DS_MERCHANT_MERCHANTURL:            params[:merchant_url]             || config.merchant_url,
        DS_MERCHANT_URLOK:                  params[:url_ok]                   || config.url_ok,
        DS_MERCHANT_URLKO:                  params[:url_ko]                   || config.url_ko,
        DS_MERCHANT_CONSUMERLANGUAGE:       params[:consumer_language]        || config.consumer_language
      }
      values[:DS_MERCHANT_MERCHANTSIGNATURE] = signature(values)
      
      concat values.map {|k,v| hidden_field_tag k, v if v  }.compact!
      
    end
  end
end