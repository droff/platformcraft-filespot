require 'json'

module Filespot
  class Response
    attr_reader :code, :status, :data

    def initialize(response)
      json_data = JSON.parse(response.body)
      @code = json_data.delete('code').to_i
      @status = json_data.delete('status')
      @data = json_data
    end
  end
end
