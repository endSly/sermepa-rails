module Sermepa
  module FormHelper
    def sermepa_form_fields(amount, params = {})
      values = {
        DS_MERCHANT_AMOUNT:                 amount.to_i,
        DS_MERCHANT_CURRENCY:               CURRENCIES[params[:currency]      || Sermepa.config.currency],
        DS_MERCHANT_PRODUCTDESCRIPTION:     params[:description],
        DS_MERCHANT_TITULAR:                params[:titular],
        DS_MERCHANT_ORDER:                  params[:order]                    || Time.now.to_i,
        DS_MERCHANT_MERCHANTCODE:           params[:merchant_code]            || Sermepa.config.merchant_code,
        DS_MERCHANT_TERMINAL:               params[:terminal]                 || Sermepa.config.terminal,
        DS_MERCHANT_TRANSACTIONTYPE:        FORM_TRANSACTION_TYPES[params[:transaction_type]],
        DS_MERCHANT_MERCHANTURL:            params[:merchant_url]             || Sermepa.config.merchant_url,
        DS_MERCHANT_URLOK:                  params[:url_ok]                   || Sermepa.config.url_ok,
        DS_MERCHANT_URLKO:                  params[:url_ko]                   || Sermepa.config.url_ko,
        DS_MERCHANT_CONSUMERLANGUAGE:       params[:consumer_language]        || Sermepa.config.consumer_language
      }
      values[:DS_MERCHANT_MERCHANTSIGNATURE] = Sermepa::signature(values)
      values
    end
  
    def sermepa_payment_form(amount, params = {}, &block)
      values = sermepa_form_fields(amount, params)
      output = ActiveSupport::SafeBuffer.new

      output << form_tag(Sermepa.config.post_url, :method => :post) do
        innerOutput = ActiveSupport::SafeBuffer.new
        values.each_pair do |k,v|
          innerOutput << hidden_field_tag(k, v) if v
        end
        innerOutput << (block_given?? capture(&block) : submit_tag(t 'sermepa.payment_form.send_action'))
      end

      output
    end


  end
end