class Bitbucket
  attr_reader :url, :object

  def initialize(object, options = {})
    @object = object
    @url = options[:url] || "https://bitbucket.org/"
  end

  def url
    "git@bitbucket.org:#{object.user_name}/#{object.repo_name}.git"
  end
end
