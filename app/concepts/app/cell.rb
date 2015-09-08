require 'trb/cell/grid_cell.rb'

class App::Cell < Cell::Concept
  include ::Cell::Erb
  include Cell::GridCell

  self.classes = ["box", "large-3", "columns"]

  property :id
  property :name
  property :git
  property :script

  def link_to_name
    link_to "#{model.id} - #{model.name}", app_path(model)
  end

  def show
    render
  end

  private

  def name_link
    link_to name, app_path(model)
  end

  # The public helper that collects latest apps and renders the grid.
  class Grid < Cell::Concept
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
