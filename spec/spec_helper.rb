require 'webmock/rspec'
require 'filespot'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:each) do
    allow(Time).to receive(:now).and_return(1450342665)

    Filespot.configure do |config|
      config.url = 'api.platformcraft.ru'
      config.version = '1'
      config.apiuserid = 'test'
      config.apikey = 'APIUserKey'
    end
  end
end

def stub_get(api_method, fixture_name)
  encoding = 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3'
  agent = 'Faraday v0.9.2'
  uri = /api.platformcraft.ru\/1/
  stub_request(:get, uri).with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=> encoding, 'User-Agent'=> agent}).to_return(status: 200, body: fixture(fixture_name), headers: {})
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.read(fixture_path + '/' + file)
end
