require 'spec_helper'

describe Filespot::Digest do
  context 'fake data' do
    subject { Filespot::Digest.hmac('GET', 'api.platformcraft.ru/1/objects?apiuserid=test&timestamp=1450342665') }

    it '.hmac' do
      allow(Filespot).to receive(:apikey) { "APIUserKey" }
      expect(subject).to eq '46c5500379d2c09c6f8972c7fd79c27fd7ebf0dd0ab47833a034fd613a4f4d93'
    end
  end
end
