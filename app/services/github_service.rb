class GithubService
  def initialize(user)
    @user = user
    @connection = Faraday.new(url: "https://api.github.com/")
    @connection.headers[:Authorization] = "token #{@user.oauth_token }"
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_repos
    @connection.get "/user/repos"
  end

  def repos_hash
    parse(get_repos)
  end

  def get_gists
    @connection.get "/gists"
  end

  def gists_hash
    parse(get_gists)
  end

  # def get_users
  #   @connection.get "/users"
  # end
  #
  # def users_hash
  #   parse(get_users)
  # end
end
