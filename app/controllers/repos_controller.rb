class ReposController < ApplicationController
  before_action :initialize_repo

  def index
    @repos = Repo.all
  end

  private

  def initialize_repo
  service = GithubService.new(current_user)
  Repo.initialize_service(service)
  end
end
