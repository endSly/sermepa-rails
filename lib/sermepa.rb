require "sermepa/sermepa"
require "sermepa/config"
require "sermepa/form_helper"
require "sermepa/signature"
require "sermepa/utils"
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
