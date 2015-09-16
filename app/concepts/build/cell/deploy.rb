class Build::Cell::Deploy < Cell::Concept
  inherit_views Build::Cell

  def list_commits
  end

  def list_tags
  end

  def show
    render :deploy
  end
end
