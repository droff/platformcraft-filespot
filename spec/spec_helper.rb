require 'webmock/rspec'
require './lib/filespot'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

def stub_get(uri, fixture_name)
  encoding = 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3'
  agent = 'Faraday v0.9.2'
  stub_request(:get, uri).with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=> encoding, 'User-Agent'=> agent}).to_return(status: 200, body: fixture(fixture_name), headers: {})
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.read(fixture_path + '/' + file)
end
