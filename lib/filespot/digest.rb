require 'openssl'
require 'base64'

module Filespot
  ##
  # Digest class provides some encryption features
  class Digest

    # generates HMAC[https://en.wikipedia.org/wiki/Hash-based_message_authentication_code]
    def self.hmac(http_method, uri)
      data = "#{http_method.upcase}+#{URI.decode(uri).gsub(/\Ahttps?:\/\//, '')}"
      OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), Filespot.apikey, data)
    end
  end
end
