require 'spec_helper'

describe Filespot::Client do
  describe 'Objects' do
    before do
      allow(Time).to receive(:now).and_return(1450342665)

      Filespot.configure do |config|
        config.url = 'api.platformcraft.ru'
        config.version = '1'
        config.apiuserid = 'test'
        config.apikey = 'APIUserKey'
      end
    end

    it '.get_objects' do
      uri = 'http://api.platformcraft.ru/1/objects?apiuserid=test&hash=46c5500379d2c09c6f8972c7fd79c27fd7ebf0dd0ab47833a034fd613a4f4d93&timestamp=1450342665'
      stub_get(uri, 'objects.json')
      objects = Filespot::Client.get_objects
      expect(objects.count).to eq 2
    end
  end
end
