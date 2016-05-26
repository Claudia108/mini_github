class GistsController < ApplicationController
  before_action :initialize_gist

  def index
    @gists = Gist.all
  end


  private

  def initialize_gist
  service = GithubService.new(current_user)
  Gist.initialize_service(service)
  end
end
