class Repo < OpenStruct
  def self.inititalize_service(service)
    @service = service
  end

  def self.all
    temp_repos_hash = @service.repos_hash
    # binding.pry
    temp_repos_hash.map do |temp_repo_hash|
      Repo.new(temp_repo_hash)
    end
  end

  # def self.find(id)
  #   temp_repo_hash = @service.repo_hash(id)
  #   Repo.new(temp_repo_hash)
  # end

end
