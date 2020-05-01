# frozen_string_literal: true

require 'dotenv/load'
require 'charity_commission_api_client/version'
require 'savon'

# example for lrug talk
module SoapApiClient
  class Error < StandardError; end
  def self.charities
    savon.call(:get_charities, message: {
                 APIKey: ENV['API_KEY'],
                 strSearch: 'harrow'
               }).body
  end

  WSDL_FILE = File.join(File.dirname(__FILE__), 'wsdl/charity_api.wsdl')

  def self.savon
    Savon.client(wsdl: WSDL_FILE,
                 endpoint: ENV['ENDPOINT'],
                 namespace_identifier: nil,
                 env_namespace: :soap,
                 element_form_default: :unqualified,
                 convert_request_keys_to: :none,
                 log: ENV['LOGGING'] == 'true')
  end
end
