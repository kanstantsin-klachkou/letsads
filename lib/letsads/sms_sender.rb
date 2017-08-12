class Letsads::SmsSender
  attr_reader :phone_numbers, :message

  def send_sms phone_numbers, message
    post_xml api_endpoint, generated_xml(phone_numbers, message)
  end

  private

  def api_endpoint
    Letsads::EXTERNAL_API_ENDPOINT
  end

  def post_xml url_string, xml_string
    response = RestClient.post api_endpoint, xml_string , {:content_type => :xml}

    response.code == 200 ? true : false
  end

  def generated_xml phone_numbers, message
   @generated_xml ||= xml_generator.send_sms_xml phone_numbers, message
  end

  def xml_generator
    @xml_generator ||= Letsads::XMLGenerator.new
  end
end
