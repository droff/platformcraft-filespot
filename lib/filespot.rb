require 'filespot/version'
require 'filespot/configuration'
require 'filespot/digest'
require 'filespot/request'
require 'filespot/response'
require 'filespot/client'

##
# Filespot gem module
module Filespot
  extend Configuration

  Error = Class.new(StandardError)
  TaskError = Class.new(Error)
end
