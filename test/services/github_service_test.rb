require 'test_helper'

class GithubServiceTest < ActiveSupport::TestCase

  # test 'initialization' do
  #     VCR.use_cassette('example') do
  #       steven = users(:steven)
  #       user = GithubService.new(steven)
  #       assert user
  #     end
  #   end

  test '#repos' do
    VCR.use_cassette('repos') do
      user = User.new(oauth_token: ENV["USER_TOKEN"] )
      service = GithubService.new(user)
      repos = service.repos_hash

      refute repos.nil?
      assert_equal "the_pivot", repos[0][:name]
    end
  end

  test'#gists' do
    VCR.use_cassette('gists') do
      user = User.new(oauth_token: ENV["USER_TOKEN"] )
      service = GithubService.new(user)
      gists = service.gists_hash

      refute gists.nil?
      assert_equal "https://gist.github.com/22de995a4bcf33e283eb362c71d0a615", gists[0][:html_url]

    end
  end
end
