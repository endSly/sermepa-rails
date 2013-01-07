require "sermepa/sermepa"
require "sermepa/config"
require "sermepa/signature"
require "sermepa/version"

module Sermepa
  extend self

  def configure
    yield config
  end

  def config
    @config ||= Config.default
  end
  
end
