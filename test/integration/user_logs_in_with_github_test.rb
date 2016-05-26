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
    assert_equal "/dashboard", current_path
    assert page.has_content?("Claudia")
    assert page.has_link?("Logout")
  end

  test "logged in user views account information on show_page" do
    visit '/'
    click_link "Sign in with Github"
    assert_equal "/dashboard", current_path
    assert page.has_content?("Claudia")
    assert page.has_css?("img[src*='https://avatars.githubusercontent.com/u/15485124?v=3']")
    assert page.has_content?("Your Followers")
    assert page.has_content?("Your Following")
    assert page.has_link?("Logout")
  end
end
