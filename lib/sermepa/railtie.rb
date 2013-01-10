require 'sermepa/form_helper'

module Sermepa
  class Railtie < Rails::Railtie
    initializer "sermepa.form_helper" do 
      ActionView::Base.send :include, FormHelper
    end
  end
end