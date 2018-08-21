class Letsads::Client
  def send_sms(phone_numbers, message)
    sms_sender.send_sms(phone_numbers, message)
  end

  def fetch_sms_state(id)
    xml = xml_builder.sms_state_xml(id)

    RestClient.post(Letsads::EXTERNAL_API_ENDPOINT, xml, content_type: :xml)
  end

  def balance
    xml = xml_builder.balance_xml

    RestClient.post(Letsads::EXTERNAL_API_ENDPOINT, xml, content_type: :xml)
  end

  private

  def sms_sender
    @sms_sender ||= Letsads::SmsSender.new
  end

  def xml_builder
    Letsads::XMLBuilder.new
  end
end
