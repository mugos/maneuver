require 'git/repos/bitbucket.rb'

class Git < ActiveRecord::Base
  # REPOS = {"0" => 'Bitbucket', "1" => 'Github'}
  belongs_to :app

  # TODO: move to contract
  # def url=(url)
  #   match_params = /([^\s\:]+)\s*\/\s*([^\s\.git]+)/.match(url)
  #   self.user_name = match_params[1]
  #   self.repo_name = match_params[2]
  # end
  #
  # def url
  #   repo.url()
  # end
  #
  # private
  # def repo
  #   REPOS[repo_type].constantize.new(self, {})
  # end
end
