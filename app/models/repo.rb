class Repo < OpenStruct
  def self.inititalize_service(service)
    @service = service
  end

  def self.all
    temp_repos_hash = @service.repos_hash
    temp_repos_hash.map do |temp_repo_hash|
      Repo.new(temp_repo_hash)
    end
  end
end
