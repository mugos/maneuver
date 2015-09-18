# The public helper that collects latest builds and renders the grid.
class Build::Cell::Grid < Cell::Concept
  include Cell::Caching::Notifications

  cache :show do
    CacheVersion.for("build/cell/grid")
  end

  def show
    builds = Build.latest
    concept("build/cell", collection: builds, last: builds.last)
  end
end # Grid
