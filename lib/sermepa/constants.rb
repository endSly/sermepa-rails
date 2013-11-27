module Sermepa

  CURRENCIES = {
    :EUR => '978',
    :USD => '840',
    :GBP => '826',
    :JPY => '392'
  }

  FORM_TRANSACTION_TYPES = {
    # Payment Requests
    :traditional_payment =>     '0',
    :preauthorization =>        '1',
    :deferred_authorization_confirmation => '2',
    :total_or_partial_devolution => '3',
    :authentication => '7',
    :authentication_confirmation => '8',
    :preauthorization_cancel => '9',
    :start_file_card => 'L',
    :next_file_card => 'M',
    :deferred_preauthorization => 'O',
    :deferred_preauthorization_confirmation => 'P',
    :deferred_preauthorization_cancel => 'Q'
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