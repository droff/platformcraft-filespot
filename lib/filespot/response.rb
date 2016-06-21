require 'json'

module Filespot
  class Response
    attr_reader :code, :status, :data

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
