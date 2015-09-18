class Repo::Bitbucket < Git
  def bitbucket_client
    BitBucket.new login: self.user_name, password: self.api_key
  end

  def list_commits
    bitbucket_client.repos.commits.get self.user_name, self.repo_name
  end

  def list_tags
    bitbucket_client.repos.tags.get self.user_name, self.repo_name
  end
end
