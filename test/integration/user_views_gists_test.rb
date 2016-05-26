require 'test_helper'

class UserViewsGistsTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = MiniGithub::Application
    stub_omniauth
  end

  test "user needs to login to view their gists" do
    visit '/'
    click_link "My Gists"
    assert_equal "/", current_path
    assert page.has_content?("Please login to access your information!")

    click_link "Sign in with Github"
    assert_equal "/dashboard", current_path
    assert page.has_content?("Claudia Kiesenhofer, welcome to your Mini Github!")
    assert page.has_link?("Logout")

    click_link "My Gists"
    assert_equal "/gists", current_path
    assert page.has_content?("My Gists")
    assert page.has_link?("Setting_expectations.markdown")

    click_link "Logout"
    assert_equal "/", current_path
    click_link "My Gists"
    assert_equal "/", current_path
    assert page.has_content?("Please login to access your information!")
  end

end
