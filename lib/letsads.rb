require 'nokogiri'
require 'rest-client'

require 'letsads/version'
require 'letsads/client'
require 'letsads/sms_sender'
require 'letsads/xml_builder'

module Letsads
  EXTERNAL_API_ENDPOINT = 'https://letsads.com/api'.freeze

  class Configuration
    class << self
      attr_accessor :login, :password, :sender
    end
  end
end
