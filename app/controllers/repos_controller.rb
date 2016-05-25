class ReposController < ApplicationController
  before_action :initialize_repo

  def index
    @repos = Repo.all
  end

  # def show
  #   @repo = Repo.find(params[:id])
  # end

  private

  def initialize_repo
  service = GithubService.new(current_user)
  Repo.inititalize_service(service)
  end
end
