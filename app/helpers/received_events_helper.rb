module ReceivedEventsHelper
  def repo_names(event)
    event[:repo][:name].capitalize
  end

  def contributor(event)
    event[:actor][:login].capitalize
  end
end
