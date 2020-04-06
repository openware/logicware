require "bundler/setup"
require "logicware"
require "logicware/rack/jwt"
require "rack/test"

RSpec.configure do |config|
  # Include Rack::Test::Methods
  config.include Rack::Test::Methods

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
