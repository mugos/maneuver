class Repo::Bitbucket < Git
  def bitbucket_client
    BitBucket.new login: self.user_name, password: self.api_key
  end

  def list_commits
    commits = bitbucket_client.repos.commits.get self.user_name, self.repo_name
    commits[:values]
  end

  def list_tags
    abort
  end
end
