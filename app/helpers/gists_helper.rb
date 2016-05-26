module GistsHelper
  def self.gist_name(gist)
    file_name = gist.files.keys.to_s.gsub(/\W/, " ")
    file_name.strip.gsub(" ", ".").capitalize
  end
end
