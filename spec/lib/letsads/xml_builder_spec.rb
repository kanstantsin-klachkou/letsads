describe Letsads::XMLBuilder do
  describe '#send_sms_xml'
    let(:phone_numbers) { [123456789, 123456729] }
    let(:message) { 'some_text_message' }
    let(:xml_builder) { Letsads::XMLBuilder.new }
    let(:generated_xml_string) { xml_builder.send_sms_xml phone_numbers, message }

    it 'should generate correct xml' do
      doc = Nokogiri::XML(generated_xml_string)
      
      expect(doc.xpath('//text').text).to eq message
      expect(doc.xpath('//recipient').count).to eq 2
      expect(doc.xpath('//recipient')[0].text).to eq phone_numbers[0].to_s
      expect(doc.xpath('//recipient')[1].text).to eq phone_numbers[1].to_s
    end
end




# expectected_xml = "<?xml version=\"1.0\"?>\n<root>\n  <request>\n    <auth>\n      <login=>#{login}</login=>\n      <password=>#{password}</password=>\n    </auth>\n    <message>\n      <from=>#{sender}</from=>\n      <text=>#{message}</text=>\n      <recipient=>#{one_number}</recipient=>\n    </message>\n  </request>\n</root>\n"
