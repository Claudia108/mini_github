require 'test_helper'

class ReceivedEventTest < ActiveSupport::TestCase
  test "it shows all received events for logged in user" do
    VCR.use_cassette('received_events') do
      user = User.new(username: "Claudia108", oauth_token: ENV["USER_TOKEN"] )
      ReceivedEvent.initialize_service(GithubService.new(user))

      assert_equal 30, ReceivedEvent.count
      assert_equal "alirezaandersen", ReceivedEvent.contributors[0]
      assert_equal "alirezaandersen/the_pivot", ReceivedEvent.repo_names[0]

      assert_equal "Salvi6God", ReceivedEvent.contributors[29]
      assert_equal "alirezaandersen/the_pivot", ReceivedEvent.repo_names[29]
    end
  end
end
