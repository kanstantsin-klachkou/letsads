class Letsads::Client
  def send_sms(phone_numbers, message)
    sms_sender.send_sms(phone_numbers, message)
  end

  private

  def sms_sender
    @sms_sender ||= Letsads::SmsSender.new
  end
end
