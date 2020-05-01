# frozen_string_literal: true

require 'bundler/setup'
require 'charity_commission_api_client'

require 'pry-byebug'
require 'simplecov'
require 'simplecov-console'

require 'vcr'

VCR.configure do |config|
  config.default_cassette_options = {
    match_requests_on: %i[method uri body],
    record: ENV['VCR_RECORD']&.to_sym || :none
  }

  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!

  config.filter_sensitive_data('<API_KEY>') { ENV['API_KEY'] }
end

# RSpec.configure do |c|
#   c.treat_symbols_as_metadata_keys_with_true_values = true
# end

SimpleCov.start do
  add_filter '/spec/'
end
SimpleCov.formatter = SimpleCov::Formatter::Console

RSpec.configuration.when_first_matching_example_defined(focus: true) do
  SimpleCov.formatter = SimpleCov::Formatter::SimpleFormatter
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
