require 'test_helper'

class GistTest < ActiveSupport::TestCase
  test "it finds all gists for logged in user" do
    VCR.use_cassette('gists') do
      user = User.new(oauth_token: ENV["USER_TOKEN"] )
      Gist.inititalize_service(GithubService.new(user))

      assert_equal 4, Gist.all.count
      # assert_equal "https://gist.github.com/22de995a4bcf33e283eb362c71d0a615", Gist.all[0][:html_url]
    end
  end
end
