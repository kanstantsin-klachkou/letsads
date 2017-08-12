require 'rest-client'

require 'letsads/version'
require 'letsads/client'
require 'letsads/sms_sender'
require 'letsads/xml_generator'

module Letsads
  EXTERNAL_API_ENDPOINT = 'https://letsads.com/api'.freeze
end
