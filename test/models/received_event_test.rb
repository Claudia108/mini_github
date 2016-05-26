require 'test_helper'

class ReceivedEventTest < ActiveSupport::TestCase
  test "it shows all received events for logged in user" do
    VCR.use_cassette('received_events') do
      user = User.new(username: "Claudia108", oauth_token: ENV["USER_TOKEN"] )
      ReceivedEvent.initialize_service(GithubService.new(user))

      assert_equal 30, ReceivedEvent.count
      assert_equal "alirezaandersen", ReceivedEvent.all[0][:actor][:login]
      assert_equal "alirezaandersen/the_pivot", ReceivedEvent.all[0][:repo][:name]

      assert_equal "Salvi6God", ReceivedEvent.all[29][:actor][:login]
      assert_equal "alirezaandersen/the_pivot", ReceivedEvent.all[29][:repo][:name]
    end
  end
end
