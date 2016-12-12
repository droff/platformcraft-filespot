require 'filespot/client/objects'
require 'filespot/client/download'

module Filespot
  ##
  # Client class provides a communication with API by methods
  class Client
    extend Objects
    extend Download
  end
end
