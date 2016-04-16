require 'json'

module Filespot
  class Response
    attr_reader :code, :status, :data

    def initialize(response)
      if response.status == 200
        json_data = JSON.parse(response.body)
        @code = json_data.delete('code').to_i
        @status = json_data.delete('status')
        @data = json_data
      else
        return_error
      end
    end

    private

    def return_error
      @code = 500
      @status = 'error'
      @data = nil
    end
  end
end
