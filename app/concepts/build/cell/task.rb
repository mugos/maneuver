class Build::Cell::Task < Cell::Concept
  inherit_views Build::Cell

  def list_tasks
  end

  def show
    render :task
  end
end
