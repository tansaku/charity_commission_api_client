# frozen_string_literal: true

require 'soap_api_client/version'
require 'savon'

# example for lrug talk
module SoapApiClient
  class Error < StandardError; end
  def self.list_movies
    @savon = Savon.client(wsdl: File.join(File.dirname(__FILE__), 'wsdl/movies.wsdl'),
                          endpoint: 'http://localhost:8888',
                          namespace_identifier: nil,
                          env_namespace: :soap,
                          element_form_default: :unqualified, # Do not qualify requests (i.e. do not add the xmlns: prefix to GetCheckDetail)
                          convert_request_keys_to: :none) # Leave keys as is, otherwise CheckNumber gets converted to checkNumber

    res = @savon.call(:list_movies).body
  end
end
