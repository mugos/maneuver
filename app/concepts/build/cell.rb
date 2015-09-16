require 'trb/cell/grid_cell.rb'

class Build::Cell < Cell::Concept
  include Cell::Haml
  include Cell::GridCell

  self.classes = ["box", "large-3", "columns"]

  def show
    render
  end

  def name_link
    link_to "----------", build_path(model)
  end

  class Form < Cell::Concept
    inherit_views Build::Cell

    # include Reform::Form::ActiveModel
    # include Reform::Form::ActiveModel::FormBuilderMethods
    include ActionView::RecordIdentifier
    include SimpleForm::ActionViewExtensions::FormHelper
    include ActionView::Helpers::FormOptionsHelper

    def show
      render :form
    end

    private

    property :contract
  end

  # The public helper that collects latest builds and renders the grid.
  class Grid < Cell::Concept
    include Cell::Caching::Notifications

    cache :show do
      CacheVersion.for("build/cell/grid")
    end

    def show
      builds = Build.latest
      concept("build/cell", collection: builds, last: builds.last)
    end
  end
end
