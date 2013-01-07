module Sermepa
  
  Config = Struct.new(:_logger, :service_url, :merchant_code, :secret, :terminal, :currency, :raise_errors, :callback_url) do

    def self.default
      config = new
      config._logger = Logger.new STDOUT
      config.raise_errors = true
      config
    end
    
  end
end