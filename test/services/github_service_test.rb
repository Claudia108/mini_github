require 'test_helper'

class GithubServiceTest < ActiveSupport::TestCase
  test '#repos' do
    VCR.use_cassette('repos') do
      user = User.new(oauth_token: ENV["USER_TOKEN"] )
      service = GithubService.new(user)
      repos = service.repos_hash

      refute repos.nil?
      assert_equal "the_pivot", repos[0][:name]
      assert_equal "https://github.com/alirezaandersen/the_pivot", repos[0][:html_url]
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

  test '#orgs' do
    VCR.use_cassette('orgs') do
      user = User.new(username: "Claudia108", oauth_token: ENV["USER_TOKEN"] )
      service = GithubService.new(user)
      orgs = service.orgs_hash

      refute orgs.nil?
      assert_equal "https://avatars.githubusercontent.com/u/19580612?v=3", orgs[0][:avatar_url]
    end
  end

  test '#starred' do
    VCR.use_cassette('starred') do
      user = User.new(username: "Claudia108", oauth_token: ENV["USER_TOKEN"] )
      service = GithubService.new(user)
      starred = service.starred_hash

      refute starred.nil?
      assert_equal 1, starred
    end
  end

  test '#events' do
    VCR.use_cassette('events') do
      user = User.new(username: "Claudia108", oauth_token: ENV["USER_TOKEN"] )
      service = GithubService.new(user)
      events = service.events_hash

      refute events.nil?
      assert_equal "Claudia108/mini_github", events[0][:repo][:name]
    end
  end

  test '#received_events' do
    VCR.use_cassette('received_events') do
      user = User.new(username: "Claudia108", oauth_token: ENV["USER_TOKEN"] )
      service = GithubService.new(user)
      received_events = service.received_events_hash

      refute received_events.nil?
      assert_equal "alirezaandersen", received_events[0][:actor][:login]
      assert_equal "alirezaandersen/the_pivot", received_events[0][:repo][:name]
    end
  end
end
