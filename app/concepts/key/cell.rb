class Key::Cell < Cell::Concept
  include Cell::Haml

  property :name
  property :value

  def show
    render
  end

  property :contract

  class Form < Key::Cell
    inherit_views Key::Cell

    include ActionView::RecordIdentifier
    include SimpleForm::ActionViewExtensions::FormHelper

    def show
      render :form
    end
  end
end
