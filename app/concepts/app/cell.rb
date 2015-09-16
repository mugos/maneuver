require 'trb/cell/grid_cell.rb'

class App::Cell < Cell::Concept
  include Cell::Haml
  include Cell::GridCell

  self.classes = ["box", "large-3", "columns"]

  def show
    render
  end

  def name_link
    link_to "#{model.id} - #{model.name}", app_path(model)
  end

  class Form < Cell::Concept
    inherit_views App::Cell

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
    #
    # def git_select_boxes(form)
    #   # select_tag 'app[git][repo_type]', options_for_select([['Bitbucket', 0], ['Github', 1]])
    #   form.select :repo_type, [['Bitbucket', 0], ['Github', 1]]#, { checked: contract.git.id }
    # end

    # TODO: Select for group
    def select_for_group(form)
      form.input :group, placeholder: "Group", label: false
    end

    def hosts_check_boxes(form)
      form.collection_check_boxes :hosts, Host.all, :id, :name, { checked: contract.hosts.map(&:id) }
    end
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
