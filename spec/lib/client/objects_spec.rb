require 'spec_helper'

describe Filespot::Client do
  describe 'Objects' do
    it '.get_objects' do
      stub_get('/objects', 'objects.json')
      objects = Filespot::Client.get_objects
      expect(objects.count).to eq 2
    end
  end
end
