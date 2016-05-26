require 'test_helper'

class RepoTest < ActiveSupport::TestCase
  test "it finds all repos for logged in user" do
    VCR.use_cassette('repos') do
      user = User.new(oauth_token: ENV["USER_TOKEN"] )
      Repo.inititalize_service(GithubService.new(user))

      assert_equal 28, Repo.all.count
      assert_equal "the_pivot", Repo.all[0][:name]
    end
  end
end
