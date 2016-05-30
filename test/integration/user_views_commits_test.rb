require 'test_helper'

class UserViewsCommitsTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = MiniGithub::Application
    stub_omniauth
  end

  test "user needs to login to view their commits" do
    visit '/'
    assert page.has_no_content?("My Commits")
    assert page.has_content?("Please login to access your information!")

    click_link "Sign in with Github"
    assert_equal "/dashboard", current_path
    assert page.has_content?("Claudia Kiesenhofer, welcome to your Mini Github!")
    assert page.has_link?("Logout")

    click_link "My Commits"
    assert_equal "/users/:username/events", current_path
    assert page.has_content?("Recent Commits")
    assert page.has_content?("Claudia108/mini_github")

    click_link "Logout"
    assert_equal "/", current_path
    assert page.has_no_content?("My Commits")
    assert page.has_content?("Please login to access your information!")
  end
end
