require 'lol_client'
require 'factory_girl'
require 'faker'
require 'vcr'
#require 'webmock/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.expand_path('spec/support/**/*.rb')].each(&method(:require))

# Define factories.
FactoryGirl.find_definitions

# Hide warnings generated through Faker.
I18n.enforce_available_locales = false

VCR.configure do |config|
  config.hook_into :webmock
  config.cassette_library_dir = 'spec/fixtures/cassettes'

  # Allow requests to be made when a cassette doesn't exist.
  config.allow_http_connections_when_no_cassette = true

  # Ensure new requests are recorded.
  config.default_cassette_options = { record: :once }

  # Prevent sensitive information from being recorded to new cassettes.
  config.filter_sensitive_data('<API_KEY>') { ENV['API_KEY'] }
end

RSpec.configure do |config|
  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  # Enable fancy FactoryGirl invocation syntax.
  config.include FactoryGirl::Syntax::Methods

  # Enable filtered runs.
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run focus: true
end
