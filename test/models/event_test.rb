require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "it filters all events by type for logged in user" do
    VCR.use_cassette('events') do
      user = User.new(username: "Claudia108", oauth_token: ENV["USER_TOKEN"] )
      Event.initialize_service(GithubService.new(user))

      assert_equal 6, Event.commit_count
      assert_equal "Claudia108/mini_github", Event.commit_names[0]
    end
  end
end
