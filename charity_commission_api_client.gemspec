# frozen_string_literal: true

require_relative 'lib/charity_commission_api_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'charity_commission_api_client'
  spec.version       = SoapApiClient::VERSION
  spec.authors       = ['Sam Joseph']
  spec.email         = ['tansaku@gmail.com']

  spec.summary       = 'example soap client for london ruby users talk'
  spec.description = 'example soap client for london ruby users talk'
  spec.homepage = 'https://github.com/tansaku/charity_commission_api_client'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been
  # added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
