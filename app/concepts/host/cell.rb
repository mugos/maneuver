class Host::Cell < Cell::Concept
  include Cell::Haml

  def show
    render
  end

  property :contract

  def name_link
    link_to "#{model.id} - #{model.name}", host_path(model)
  end

  class Form < Host::Cell
    inherit_views Host::Cell

    include ActionView::RecordIdentifier
    include SimpleForm::ActionViewExtensions::FormHelper
    include ActionView::Helpers::FormOptionsHelper

    # def key_select_box(form)
    #   pp form.object
    #   form.collection_select :id, Key.all, :id, :name
    # end

    def show
      render :form
    end
  end
end
