class Git < ActiveRecord::Base
  # REPOS = {"0" => 'Bitbucket', "1" => 'Github'}
  belongs_to :app

  # TODO: move to contract

  def match_params
    /([^\s\:]+)\s*\/\s*([^\s\.git]+)/.match(self.url)
  end

  def url=(url)
    write_attribute(:url, url)
    write_attribute(:user_name, match_params[1])
    write_attribute(:repo_name, match_params[2])
  end
end
