require 'openssl'
require 'base64'

module Filespot
  class Digest
    def self.hmac(http_method, uri)
      data = "#{http_method.upcase}+#{URI.decode(uri).gsub('http://', '')}"
      OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), Filespot.apikey, data)
    end
  end
end
