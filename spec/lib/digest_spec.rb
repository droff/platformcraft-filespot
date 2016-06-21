describe Filespot::Digest do
  context '#hmac' do
    let (:apikey) { 'APIUserKey' }
    let (:url)  { 'api.platformcraft.ru/1/objects?apiuserid=test&timestamp=1450342665' }
    let (:hash) { OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), apikey, "GET+#{url}") }

    subject { described_class.hmac('GET', url) }


    it 'evaluate correct' do
      allow(Filespot).to receive(:apikey).and_return(apikey)

      expect(subject).to eq hash
    end
  end
end
