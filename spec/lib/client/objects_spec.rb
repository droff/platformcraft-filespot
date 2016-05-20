require 'spec_helper'

describe Filespot::Client do
  describe 'Objects' do
    it '#get_objects' do
      stub_get('/objects', 'objects.json')
      objects = Filespot::Client.get_objects
      expect(objects.count).to eq 2
    end

    it '#get_object' do
      stub_get('/objects/56787f0c044dfe226b000001', 'objects_id.json')
      object = Filespot::Client.get_object('56787f0c044dfe226b000001')
      expect(object.id).to eq '56787f0c044dfe226b000001'
    end
  end
end
