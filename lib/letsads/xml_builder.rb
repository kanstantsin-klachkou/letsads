class Letsads::XMLBuilder
  def send_sms_xml(recipients, text)
    builder = ::Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
      xml.root {
        xml.request {
          xml.auth {
            xml.login Letsads::Configuration.login
            xml.password Letsads::Configuration.password
          }
          xml.message {
            xml.from Letsads::Configuration.sender
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
