module Filespot

  ##
  # Configuration module provides gem settings
  #
  #   Filespot.configure do |config|
  #     config.url = 'api.platformcraft.ru'
  #     config.version = 1
  #     config.apikey = '12345'
  #     config.apiuserid = '12345'
  #   end
  #
  module Configuration
    # default API url
    API_URL = 'api.platformcraft.ru'
    #default API version
    API_VERSION = 1

    # options
    OPTIONS = [
      :url, :version, :apiuserid, :apikey
    ].freeze

    # settings attributes
    attr_accessor *OPTIONS

    # invoke module
    def self.extended(base)
      base.init
    end

    # set default params
    def init
      self.url = API_URL
      self.version = API_VERSION
      self.apiuserid = nil
      self.apikey = nil
    end

    # configure with gem settings
    def configure
      yield self
    end
  end
end
