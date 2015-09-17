class Build
  class Runner
    def self.exec(build_id)
      build = Build.find(build_id)

      # Run task
      hash = Caracara::SSH.exec build.script

      # Save log
      build.logs << Log.new(name: build.script, value: hash[:result])

      # Set state
      hash[:status] ? build.state = :done : build.state = :failed

      # Completed At
      build.completed_at = Time.now

      # Persist
      build.save!

    rescue => e
      return e
    end
  end
end
