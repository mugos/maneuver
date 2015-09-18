class Build::Cell::Deploy < Build::Cell
  def show
    self.
    concept("build/cell", collection: builds)
  end

  def list_commits
    pp '------------'
    pp self.app.class.name
    pp '------------'
    abort
    self.model.app.git.list_commits
  end

  def deploy_status(commit)
    build = Build.find_by_reference(commit)
    if build
      build.state
    else
      'Not Built'
    end
  end

  def deploy_status_class(commit)
    build = Build.find_by_reference(commit)
    if build
      build.state
    else
      '.not_built'
    end
  end
end # Deploy
