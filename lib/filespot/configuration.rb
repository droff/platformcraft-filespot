module Filespot
  module Configuration
    API_URL = 'api.platformcraft.ru'
    API_VERSION = 1

    OPTIONS = [
      :url, :version, :apiuserid, :apikey
    ].freeze

    attr_accessor *OPTIONS

    def self.extended(base)
      base.init
    end

    def init
      self.url = API_URL
      self.version = API_VERSION
      self.apiuserid = nil
      self.apikey = nil
    end

    def configure
      yield self
    end
  end
end
