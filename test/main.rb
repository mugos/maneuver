
require 'bitbucket_rest_api'

USER = 'yebo-dev'
PASSWORD = 'Wm7bWtsqLYLxvIekX12gGY81i1dkqUV8'
REPO = 'api'

# API 1.0 does not support commits
#
module BitBucket
  class Repos::Commits < API
    def get(user_name, repo_name)
      _update_user_repo_params(user_name, repo_name)
      _validate_user_repo_params(user, repo) unless user? && repo?
      get_request("/2.0/repositories/#{user}/#{repo.downcase}/commits")
    end
  end # Repos::Keys
end # BitBucket

# Login using API Key
client = BitBucket.new login: USER, password: PASSWORD

# Get the repo
repo = client.repos.get USER, REPO

# Get the commits
commits = client.repos.commits.get USER, REPO

#
puts "Repositório #{repo.name} do BitBucket\n"
puts ' Commits '.center(100, '-')
puts "#\t\t\tMESSAGE\t\t\tAUTHOR\t\t\t"

commits[:values].each do |commit|
  puts ''.center(100, '-')
  puts "#{commit.hash}\t#{commit.message.gsub("\n",'')}\t\t#{commit.author.raw}"
end

