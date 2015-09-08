class Key::Cell < Cell::Concept
  include Cell::Erb

  property :name
  property :value

  def show
    render
  end

  class Form < Cell::Concept
    inherit_views Key::Cell

    include ActionView::RecordIdentifier
    include SimpleForm::ActionViewExtensions::FormHelper

    def show
      render :form
    end
  end
end
