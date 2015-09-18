class Build::Cell::Form < Build::Cell
  inherit_views Build::Cell

  def show
    render :form
  end

  private

  property :contract
end # Form
