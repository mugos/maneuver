class Host::Cell < Cell::Concept
  include Cell::Erb

  property :name
  property :sys_user
  property :address
  property :source
  property :key

  def show
    render
  end

  def link_to_name
    link_to "#{model.id} - #{model.name}", host_path(model)
  end

  class Form < Cell::Concept
    inherit_views Host::Cell

    include ActionView::RecordIdentifier
    include SimpleForm::ActionViewExtensions::FormHelper
    include ActionView::Helpers::FormOptionsHelper

    def keys
      Key.all.map { |r| [r.name, r.id] }
    end

    def show
      render :form
    end
  end
end
