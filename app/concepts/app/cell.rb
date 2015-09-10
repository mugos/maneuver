require 'trb/cell/grid_cell.rb'

class App::Cell < Cell::Concept
  include Cell::Haml
  include Cell::GridCell

  self.classes = ["box", "large-3", "columns"]

  def show
    render
  end

  property :contract

  def name_link
    link_to "#{model.id} - #{model.name}", app_path(model)
  end

  class Form < App::Cell
    include ActionView::RecordIdentifier
    include SimpleForm::ActionViewExtensions::FormHelper
    include ActionView::Helpers::FormOptionsHelper

    inherit_views App::Cell

    def hosts_check_boxes(form)
      form.collection_check_boxes :hosts, Host.all, :id, :name, { checked: contract.hosts.map(&:id) }
    end

    def show
      render :form
    end
  end

  # The public helper that collects latest apps and renders the grid.
  class Grid < App::Cell
    include Cell::Caching::Notifications

    cache :show do
      CacheVersion.for("app/cell/grid")
    end

    def show
      apps = App.latest
      concept("app/cell", collection: apps, last: apps.last)
    end
  end
end
