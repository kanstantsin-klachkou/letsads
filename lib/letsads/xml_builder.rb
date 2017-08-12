class Letsads::XMLBuilder
  def send_sms_xml recipients, text
    builder = ::Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
      xml.root {
        xml.request {
          xml.auth {
            xml.login '@login'
            xml.password '@password'
          }
          xml.message {
            xml.from '@sender'
            xml.text_ text
            recipients.each do |recipient|
              xml.recipient recipient
            end
          }
        }
      }
    end
    builder.to_xml(save_with: 0).gsub("\n", '')
  end
end
