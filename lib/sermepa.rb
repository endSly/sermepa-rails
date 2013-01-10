require "sermepa/sermepa"
require "sermepa/config"
require "sermepa/signature"
require "sermepa/version"
require "sermepa/railtie" if defined?(Rails)

module Sermepa
  extend self

  def configure
    yield config
  end

  def config
    @config ||= Config.default
  end
  
end
