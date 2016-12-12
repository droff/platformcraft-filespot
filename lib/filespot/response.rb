require 'json'

module Filespot
  ##
  # Response class provides API response
  class Response
    # HTTP code
    attr_reader :code

    # response status
    attr_reader :status

    # response data in JSON format
    attr_reader :data

    # creates response, checks errors and provides data if success
    def initialize(response)
      return error if response.status == 500

      @data = JSON.parse(response.body)
      if response.status == 200
        @code = @data.delete('code').to_i
        @status = @data.delete('status')
      end
      error(response.status) unless @status
    end

    private

    def error(code=500)
      @code = code
      @status = 'error'
    end
  end
end
