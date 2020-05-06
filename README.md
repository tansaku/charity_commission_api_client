# Charity Commission Soap Api Client

This Ruby Gem is designed as a client for the Charity Commission SOAP API.

See https://apps.charitycommission.gov.uk/Showcharity/API/SearchCharitiesV1/SearchCharitiesV1.asmx?WSDL

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'charity_commission_api_client'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install charity_commission_api_client

## Usage

This is very bare bones at the moment, having been created to demonstrate use of debugging to solve tricky bugs.  However it would be great to see this expanded into a real useful client for the charity commission SOAP API.

To use the client you'll need to have a `.env` in the root of the project with something like the following in it:

```
API_KEY = <YOUR_API_KEY>
LOGGING = false
ENDPOINT = https://apps.charitycommission.gov.uk/Showcharity/API/SearchCharitiesV1/SearchCharitiesV1.asmx # 0.0.0.0:8443
PEM_FILE_PATH = <optional>
```

You'll need to request an API key from the charity commission and then you should be able to use the client like so:

```rb
require 'dotenv/load'
require 'charity_commission_api_client'

CharityCommissionApiClient::Client.new.charities('<search-string>')
```

which will return the raw soap response of a list of charities matching the search string.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tansaku/charity_commission_api_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/tansaku/charity_commission_api_client/blob/master/CODE_OF_CONDUCT.md).


## Code of Conduct

Everyone interacting in the CharityCommissionApiClient project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/tansaku/charity_commission_api_client/blob/master/CODE_OF_CONDUCT.md).
