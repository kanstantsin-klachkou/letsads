describe Letsads::Client do
  let(:letsads_client) { Letsads::Client.new }
  let(:sms_sender)     { double(Letsads::SmsSender) }
  let(:phone_numbers)  { ['375291033254'] }
  let(:message)        { 'test_msg' }

  describe '#send_sms' do
    before do
      allow(Letsads::SmsSender).to receive(:new) { sms_sender }
    end

    it 'calls Letsads::SmsSender with params' do
      expect(sms_sender).to receive(:send_sms).with(phone_numbers, message)

      letsads_client.send_sms(phone_numbers, message)
    end
  end
end
