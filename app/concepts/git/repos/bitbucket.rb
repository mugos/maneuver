class Github
  attr_reader :url, :object

  def initialize(object, options = {})
    @object = object
    @url = options[:url] || "https://github.com/"
  end

  def url
    "git@github.com:#{object.user_name}/#{object.repo_name}.git"
  end
end
