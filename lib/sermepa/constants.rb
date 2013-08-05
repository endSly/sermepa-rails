module Sermepa

  CURRENCIES = {
    :EUR => '978',
    :USD => '840',
    :GBP => '826',
    :JPY => '392'
  }

  TRANSACTION_TYPES = {
    # Payment Requests
    :traditional_payment =>     'A',
    :preauthorization =>        '1',
    :deferred_authorization =>  'O',
    :authorization =>           '0',

    # Recurrent payments
    :recurrent_transaction =>   '5',
    :deferred_initial_recurrent_authorization => 'R',
    
    # Confirmation/Refund requests
    :confirmation =>            '2',
    :automatic_refund =>        '3',
    :successive_transaction =>  '6',
    :preauthorization_cancel => '9',
    :deferred_authorization_confirmation => 'P',
    :deferred_authorization_cancel =>       'Q',
    :deferred_successive_transaction_authorization => 'S'
  }

end