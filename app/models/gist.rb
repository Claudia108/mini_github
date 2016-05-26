class Gist < OpenStruct
  def self.initialize_service(service)
    @service = service
  end

  def self.all
    temp_gists_hash = @service.gists_hash
    temp_gists_hash.map do |temp_gist_hash|
      Gist.new(temp_gist_hash)
    end
  end
end
