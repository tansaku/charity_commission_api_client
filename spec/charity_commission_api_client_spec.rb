# frozen_string_literal: true

RSpec.describe SoapApiClient, :vcr do
  it 'has a version number' do
    expect(SoapApiClient::VERSION).not_to be nil
  end

  let(:client) do
    described_class
  end

  fit 'charities' do
    expect(client.charities).not_to be nil
  end
end
