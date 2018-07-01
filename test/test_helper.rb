ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def api_token
    ActionController::HttpAuthentication::Token.encode_credentials(users(:foo).api_token)
  end
end
