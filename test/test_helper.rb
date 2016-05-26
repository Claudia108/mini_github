require "simplecov"
SimpleCov.start "rails"

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/pride'
require "capybara/rails"
# require "test/unit"
require "vcr"
require "webmock"
require "minitest-vcr"
require "mocha/mini_test"


class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  VCR.configure do |config|
    config.cassette_library_dir = 'test/cassettes'
    config.hook_into :webmock
    config.allow_http_connections_when_no_cassette = true
  end
  MinitestVcr::Spec.configure!

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      uid: "15485124",
      info: {
        name: "Claudia Kiesenhofer",
        nickname: "Claudia108",
        image: "https://avatars.githubusercontent.com/u/15485124?v=3",
        email: "me@me.com"
      },
      credentials: {
        token: ENV["USER_TOKEN"]
      },
      extra: {
        raw_info: {
          following: 3,
          followers: 5
        }
      }
    })
  end


  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

end
