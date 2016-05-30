require 'test_helper'

class UserViewsReposTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = MiniGithub::Application
    stub_omniauth
  end

  test "user needs to login to view their repos" do
    visit '/'
    assert page.has_no_content?("My Repos")
    assert page.has_content?("Please login to access your information!")

    click_link "Sign in with Github"
    assert_equal "/dashboard", current_path
    assert page.has_content?("Claudia Kiesenhofer, welcome to your Mini Github!")
    assert page.has_link?("Logout")

    click_link "My Repos"
    assert_equal "/user/repos", current_path
    assert page.has_content?("My Repos")
    assert page.has_link?("The_pivot")

    click_link "Logout"
    assert_equal "/", current_path
    assert page.has_no_content?("My Repos")
    assert page.has_content?("Please login to access your information!")
  end
end
