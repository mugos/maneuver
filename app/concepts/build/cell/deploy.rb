class Build::Cell::Deploy < Build::Cell

  def show
    render :deploy
  end

  def list_commits(&block)
    model.git.list_commits[:values].each {|commit| block.call(commit)}
  end

  def list_tags(&block)
    model.git.list_tags.each {|tag| block.call(tag)}
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
