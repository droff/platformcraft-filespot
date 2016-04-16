require 'spec_helper'

describe Filespot::Client do
  describe 'Objects' do
    it '.get_objects' do
      uri = 'http://api.platformcraft.ru/1/objects?apiuserid=test&hash=46c5500379d2c09c6f8972c7fd79c27fd7ebf0dd0ab47833a034fd613a4f4d93&timestamp=1450342665'
      stub_get(uri, 'objects.json')
      objects = Filespot::Client.get_objects
      expect(objects.count).to eq 2
    end
  end
end
