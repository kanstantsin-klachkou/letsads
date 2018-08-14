class Letsads::Client
  def send_sms(phone_numbers, message)
    sms_sender.send_sms(phone_numbers, message)
  end

  def balance
    xml_builder = Letsads::XMLBuilder.new
    xml         = xml_builder.balance_xml
    end_point   = Letsads::EXTERNAL_API_ENDPOINT

    RestClient.post(end_point, xml, content_type: :xml)
  end

  private

  def sms_sender
    @sms_sender ||= Letsads::SmsSender.new
  end
end
