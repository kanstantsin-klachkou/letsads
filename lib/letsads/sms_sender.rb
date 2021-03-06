class Letsads::SmsSender
  def send_sms(phone_numbers, message)
    xml = generated_xml(phone_numbers, message)

    post_xml(api_endpoint, xml)
  end

  def current_balance
    xml = xml_builder.balance_xml

    post_xml(api_endpoint, xml)
  end

  private

  def api_endpoint
    Letsads::EXTERNAL_API_ENDPOINT
  end

  def post_xml(url_string, xml_string)
    response = RestClient.post(api_endpoint, xml_string, { content_type: :xml })
  end

  def generated_xml(phone_numbers, message)
   @generated_xml ||= xml_builder.send_sms_xml(phone_numbers, message)
  end

  def xml_builder
    @xml_builder ||= Letsads::XMLBuilder.new
  end
end
