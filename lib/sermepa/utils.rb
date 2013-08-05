require 'digest/sha1'

module Sermepa
  def check_signature(params, secret = nil)
    token = "#{params[:Ds_Amount]}#{params[:Ds_Order]}#{params[:Ds_MerchantCode]}#{params[:Ds_Currency]}#{params[:Ds_Response]}#{secret || config.secret}"
    
    check_code = Digest::SHA1.hexdigest(token)
    
    return true if check_code.upcase == params[:Ds_Signature].upcase
    
    # Invalid signature
    raise SermepaInvalidSignature.new if Sermepa.config.raise_errors
    false
  end

end