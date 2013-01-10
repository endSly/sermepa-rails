Sermepa Gem for Rails
=====================

How to use (SOAP WebServices)
-----------------------------

### Configure

Add initalizer for sermepa configuration (config/initializers/sermepa.rb):

```ruby
Sermepa.configure do |config|
  # For testing
  config.service_url = "https://sis-t.sermepa.es:25443/sis/services/SerClsWSEntrada/wsdl/SerClsWSEntrada.wsdl" 
  # For production
  config.service_url = "https://sis.sermepa.es/sis/services/SerClsWSEntrada/wsdl/SerClsWSEntrada.wsdl"
  
  config.merchant_code = 'Here goes merchant code'
  config.secret = 'Here goes secret'
  config.terminal = '1'       # Terminal code 
  config.currency = :EUR      # Currency (:EUR, :USD, :GBP, :JPY)
  config.raise_errors = true  # If true will raise exceptions when error ocurrs
  config.merchant_url = "Here goes callback URL"
end
```

You can add some aditional config for savon

```ruby
Savon.configure do |config|
  config.pretty_print_xml = false
end
```

### Sending payment requests

```ruby
# Timeout should be included
Timeout::timeout(20) {
  Sermepa.pay_request(pan: params[:card_number], 
                      cvv2: params[:cvv2], 
                      expiration: expiration_date,
                      amount: amount,
                      order: oreder_reference)
}
```

### Refunding payments

```ruby
Timeout::timeout(20) {
  Sermepa.refund_request(amount: amount,
                         order: reference)
}
```

### Exceptions

* Sermepa::SermepaRemoteError
* Sermepa::SermepaPaymentError

How to use (with Form)
-----------------------------

### Configure

Add initalizer for sermepa configuration (config/initializers/sermepa.rb):

```ruby
Sermepa.configure do |config|
  # For testing
  config.post_url = 'https://sis-t.sermepa.es:25443/sis/realizarPago'
  # For production
  # config.post_url = 'https://sis.sermepa.es/sis/realizarPago'
  
  config.merchant_code = 'Here goes merchant code'
  config.secret = 'Here goes secret'
  config.terminal = '1'       # Terminal code 
  config.currency = :EUR      # Currency (:EUR, :USD, :GBP, :JPY)
  config.merchant_url = "Here goes callback URL" # optional
  config.url_ok = "Success url" # optional
  config.url_ko = "Fail url"    # optional
end
```

### Adding payment form

Include form in view
```ruby
<%= sermepa_payment_form amount, {options map} do %>
  <%= submit_tag 'Send' %>
<% end %>
```

Or just:
```ruby
<%= sermepa_payment_form amount, {options map} %>
```

Allowed options are:
* currency            (optional)
* description         (optional)
* titular             (optional)
* order               (defaults to current timestamp)
* transaction_type
* merchant_url        (defaults to config)
* url_ok              (defaults to config)
* url_ko              (defaults to config)
* consumer_language   (default spanish)
* merchant_code       (defaults to config)
* terminal            (defaults to config)
