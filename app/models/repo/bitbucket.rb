class Repo::Bitbucket < Git
  def bitbucket
    BitBucket.new({
      oauth_token: self.oauth_token,
      oauth_secret: self.oauth_secret
    })
  end

  def list_commits
    abort
  end

  def list_tags
    abort
  end
end

# git = Git.first
# git.bitbucket
# bitbucket = BitBucket.new client_id: '5LgBpkqZe49AeKXLjG', client_secret: 'NEpu6ND7MjRkzbXpQEQRWcbzDB7E8hKR'
# bitbucket = BitBucket.new oauth_token: '5LgBpkqZe49AeKXLjG', oauth_secret: 'NEpu6ND7MjRkzbXpQEQRWcbzDB7E8hKR'
# bitbucket = BitBucket.new oauth_token: 'NEpu6ND7MjRkzbXpQEQRWcbzDB7E8hKR', oauth_secret: '5LgBpkqZe49AeKXLjG'
# bitbucket.repos.list
# bitbucket.repos.keys.list git.user_name, git.repo_name
#
# exeption = {}
# begin
#   bitbucket.repos.list
# rescue => e
#   exeption = e
# end
