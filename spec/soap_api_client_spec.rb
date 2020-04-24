# frozen_string_literal: true

RSpec.describe SoapApiClient do
  it 'has a version number' do
    expect(SoapApiClient::VERSION).not_to be nil
  end

  let(:client) do
    described_class
  end

  it 'lists movies' do
    expect(client.list_movies).not_to be nil
  end
end
