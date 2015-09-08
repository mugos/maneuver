class App::Cell::Form < ::Cell::Concept
  inherit_views App::Cell

  include ActionView::RecordIdentifier
  include SimpleForm::ActionViewExtensions::FormHelper

  def show
    render :form
  end
end
