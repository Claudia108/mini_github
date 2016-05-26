class Event < OpenStruct

  def self.initialize_service(service)
    @service = service
  end

  # def self.all
  #   temp_events_hash = @service.events_hash
  #   temp_events_hash.map do |temp_event_hash|
  #     Event.new(temp_event_hash)
  #   end
  # end

  def self.commits
    temp_events_hash = @service.events_hash
    temp_events_hash.select do |temp_event_hash|
      temp_event_hash[:type] == "PushEvent"
    end
  end

  def self.commit_count
    commits.count
  end

  def self.commit_names
    commits.map {|commit| commit[:repo][:name]}
  end
  #
end
