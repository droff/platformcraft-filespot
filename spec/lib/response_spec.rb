require 'spec_helper'

describe Filespot::Response do
  context 'errors' do
    let(:response) { double('response') }

    it 'nil if server error' do
      allow(response).to receive(:status).and_return(500)
      expect(Filespot::Response.new(response).data).to be_nil
    end
  end
end
