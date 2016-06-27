require 'faraday'
require 'open-uri'

module Filespot
  class Request

    def self.get(api_method = '', uri_params = {})
      uri = api_uri('GET', api_method, uri_params)
      connection(uri).get(uri.query)
    end

    def self.post(api_method = '', uri_params = {}, post_params = {})
      uri = api_uri('POST', api_method, uri_params)
      connection(uri).post(uri.query, post_params)
    end

    def self.delete(api_method = '', uri_params = {})
      uri = api_uri('DELETE', api_method, uri_params)
      connection(uri).delete(uri.query)
    end

    private

    def self.connection(uri)
      Faraday.new(uri) do |f|
        f.request :multipart
        f.request :url_encoded
        f.adapter :net_http
      end
    end

    def self.init_params(params)
      params.merge(default_params)
    end

    def self.default_params
      {
        apiuserid: Filespot.apiuserid,
        timestamp: Time.now.to_i
      }
    end

    def self.api_uri(http_method, api_method, params)
      uri = URI("https://" + Filespot.url)
      uri.path = "/#{Filespot.version}#{api_method}"
      uri.query = URI.encode_www_form(default_params)
      uri.query += "&hash=#{Digest.hmac(http_method, uri.to_s)}"
      uri.query += "&#{URI.encode_www_form(params)}" if params.any?
      uri
    end
  end
end
