class EventsController < ApplicationController
  before_action :initialize_events

  def index
    @names = Event.commit_names
    @count = Event.commit_count
  end

  private

  def initialize_events
    service = GithubService.new(current_user)
    Event.initialize_service(service)
  end
end
