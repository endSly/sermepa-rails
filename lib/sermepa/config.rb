module Sermepa
  
  Config = Struct.new(:_logger, :service_url, :merchant_code, :secret, :terminal, :currency, :raise_errors, :merchant_url, 
                      :url_ok, :url_ko, :consumer_language, :post_url) do

    def self.default
      config = new
      config._logger = Logger.new STDOUT
      config.raise_errors = true
      config.consumer_language = '001'  # ES
      config
    end
    
  end
end