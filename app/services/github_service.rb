class GithubService
  def initialize(user)
    @user = user
    @connection = Faraday.new(url: "https://api.github.com/")
    @connection.headers[:Authorization] = "token #{@user.oauth_token }"
  end

  def get_repos
    @connection.get "/user/repos"
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def repos_hash
    parse(get_repos)
  end

  # def get_repo(id)
  #   @connection.get "/user/repos/:id"
  # end
  #
  # def repo_hash(id)
  #   parse(get_repo(id))
  # end

  def get_gists
    @connection.get "/gists"
  end

  def gists_hash
    parse(get_gists)
  end
end
