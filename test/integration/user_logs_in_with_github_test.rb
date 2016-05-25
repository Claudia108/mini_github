require 'test_helper'

class UserLogsInWithGithubTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = MiniGithub::Application
    stub_omniauth
  end

  test "logging in" do
    visit '/'
    assert_equal 200, page.status_code
    click_link "Sign in with Github"
    assert_equal "/", current_path
    assert page.has_content?("Claudia")
    assert page.has_link?("Logout")
  end

  # def stub_omniauth
  #   # first, set OmniAuth to run in test mode
  #   OmniAuth.config.test_mode = true
  #   # then, provide a set of fake oauth data that
  #   # omniauth will use when a user tries to authenticate:
  #   OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
  #     provider: 'github',
  #     uid: "1234",
  #     info: {
  #       name: "Claudia",
  #       nickname: "claudia",
  #       email: "me@me.com",
  #     },
  #     credentials: {
  #       token: "fun"
  #     }
  #   })
  # end
end
