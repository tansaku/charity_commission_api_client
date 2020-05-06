# frozen_string_literal: true

require 'dotenv/load'
require 'charity_commission_api_client/version'
require 'savon'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# client for the UK Charity Commission SOAP API
module CharityCommissionApiClient
  class Error < StandardError; end
  # client for the UK Charity Commission SOAP API
  class Client
    def initialize(endpoint = ENV['ENDPOINT'])
      @endpoint = endpoint
    end

    def charities(str_search = 'harrow')
      savon.call(:get_charities, message: {
                   APIKey: ENV['API_KEY'],
                   strSearch: str_search
                 }).body
    end

    WSDL_FILE = File.join(File.dirname(__FILE__), 'wsdl/charity_api.wsdl')

    def savon
      Savon.client(wsdl: WSDL_FILE,
                   endpoint: @endpoint,
                   namespace_identifier: nil,
                   env_namespace: :soap,
                   element_form_default: :unqualified,
                   convert_request_keys_to: :none,
                   log: ENV['LOGGING'] == 'true',
                   ssl_ca_cert_file: '/usr/local/etc/stunnel/stunnel.pem')
      #  ssl_verify_mode: :none,
      # more savon steady version of OpenSSL hack
      #  ssl_ca_cert_file: '/usr/local/etc/stunnel/stunnel.pem')
    end
  end
end
