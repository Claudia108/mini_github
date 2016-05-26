class ReceivedEventsController < ApplicationController
  before_action :initialize_received_events

  def index
    @received_events = ReceivedEvent.all
    # @count = ReceivedEvent.repo_names
  end

  private

  def initialize_received_events
    service = GithubService.new(current_user)
    ReceivedEvent.initialize_service(service)
  end
end