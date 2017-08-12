describe Letsads::SmsSender do
  let(:letsads_api_enpoint) { Letsads::EXTERNAL_API_ENDPOINT }

  let(:message) { 'test_msg'}
  let(:one_number) { [123456789] }

  let(:few_different_numbers) { [123456789, 133456789, 143456789, 153456789, 163456789] }
  let(:two_equal_numbers) { [123456789, 123456789] }

  let(:sms_sender) { Letsads::SmsSender.new }
  let(:xml_generator) { double(Letsads::XMLGenerator)}
  let(:generated_xml) { 'some_xml_string' }

  describe '#send_sms' do
    before do
      stub_request(:post, letsads_api_enpoint).
        with(body: generated_xml,
             headers: {'Content-Type'=>'application/xml'}).
        to_return(status: 200)

      allow(Letsads::XMLGenerator).to receive(:new) { xml_generator }
    end

    it 'should send request to Letsads API endpont with generated XML in body' do
      expect(xml_generator).to receive(:send_sms_xml) { generated_xml }

      sending_process_result = sms_sender.send_sms one_number, message
      expect(sending_process_result).to be true
    end
  end
end
