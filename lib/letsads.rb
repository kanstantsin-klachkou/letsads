require 'active_support/core_ext/hash'
require 'nokogiri'
require 'pry'
require 'rest-client'

require_relative 'letsads/version'
require_relative 'letsads/client'
require_relative 'letsads/sms_sender'
require_relative 'letsads/xml_builder'

module Letsads
  EXTERNAL_API_ENDPOINT = 'https://letsads.com/api'.freeze

  class Configuration
    class << self
      attr_accessor :login, :password, :sender
    end
  end
end
