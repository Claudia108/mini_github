class UsersController < ApplicationController

  def index
  end

  def show
    @service = GithubService.new(current_user)
  end


end
