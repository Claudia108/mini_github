class GithubService
  def initialize(user)
    @user = user
    @connection = Faraday.new(url: "https://api.github.com")
    @connection.headers[:Authorization] = "token #{@user.oauth_token}"
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def repos_hash
    parse(@connection.get "/user/repos")
  end

  def gists_hash
    parse(@connection.get "/gists")
  end

  def orgs_hash
    parse(@connection.get "/users/#{@user.username}/orgs")
  end

  def starred_hash
    parse(@connection.get "/users/#{@user.username}/starred").count
  end

  def events_hash
    parse(@connection.get "/users/#{@user.username}/events")
  end

  def received_events_hash
    parse(@connection.get "/users/#{@user.username}/received_events")
  end
end
