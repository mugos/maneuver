require 'disc'

class CreateBuild < ActiveJob::Base
  queue_as :build

  def perform(build_id)
    Build::Runner.exec(build_id)
  end
end
