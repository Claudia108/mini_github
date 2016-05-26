class ReceivedEvent < OpenStruct

  def self.initialize_service(service)
    @service = service
  end

  def self.all
    temp_received_events_hash = @service.received_events_hash
    temp_received_events_hash.map do |temp_received_event_hash|
      ReceivedEvent.new(temp_received_event_hash)
    end
  end

  def self.count
    all.count
  end
end
