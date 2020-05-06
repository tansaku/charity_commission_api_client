# frozen_string_literal: true

RSpec.describe CharityCommissionApiClient::Client, :vcr do
  it 'has a version number' do
    expect(CharityCommissionApiClient::VERSION).not_to be nil
  end

  let(:path) { 'Showcharity/API/SearchCharitiesV1/SearchCharitiesV1.asmx' }

  let(:endpoint) { "https://apps.charitycommission.gov.uk/#{path}" }

  let(:client) do
    described_class.new(endpoint)
  end

  it 'charities' do
    expect(client.charities).not_to be nil
  end

  context 'local https' do
    let(:endpoint) { "https://0.0.0.0:8443/#{path}" }
    it 'charities' do
      expect(client.charities).not_to be nil
    end
  end
end
