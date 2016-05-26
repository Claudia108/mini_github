require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "it creates user in database" do
    user = User.from_omniauth(stub_omniauth)

    assert_equal "Claudia108", user.username
    assert_equal "Claudia Kiesenhofer", user.name
    assert_equal "me@me.com", user.email
    assert_equal "15485124", user.uid
    assert_equal ENV["USER_TOKEN"], user.oauth_token
  end
end
