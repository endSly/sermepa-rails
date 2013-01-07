Sermepa Gem for Rails
=====================

How to use
----------

### Configure

Add initalizer for sermepa configuration:

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
  config.callback_url = "Here goes callback URL"
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


