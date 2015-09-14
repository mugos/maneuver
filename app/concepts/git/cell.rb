class Git::Cell < Cell::Concept
  include Cell::Haml

  def show
    render
  end

  class Form < Git::Cell
    inherit_views Git::Cell

    include ActionView::RecordIdentifier
    include SimpleForm::ActionViewExtensions::FormHelper

    def show
      render :form
    end

    private

    property :contract
  end
end
