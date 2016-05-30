require 'test_helper'

class UserViewsCommitsTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = MiniGithub::Application
    stub_omniauth
  end

  test "user needs to login to view their received events" do
    visit '/'
    assert page.has_no_content?("Received Events")
    assert page.has_content?("Please login to access your information!")

    click_link "Sign in with Github"
    assert_equal "/dashboard", current_path
    assert page.has_content?("Claudia Kiesenhofer, welcome to your Mini Github!")
    assert page.has_link?("Logout")

    click_link "Received Events"
    assert_equal "/users/:username/received_events", current_path
    assert page.has_content?("You have 30 Received Events")
    assert page.has_content?("Alirezaandersen worked on the Repo Alirezaandersen/the_pivot")

    click_link "Logout"
    assert_equal "/", current_path
    assert page.has_no_content?("Received Events")
    assert page.has_content?("Please login to access your information!")
  end
end
