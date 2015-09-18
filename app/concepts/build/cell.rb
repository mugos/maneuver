require 'trb/cell/grid_cell.rb'

class Build::Cell < Cell::Concept
  include Cell::Haml
  include Cell::GridCell
  # include Reform::Form::ActiveModel
  # include Reform::Form::ActiveModel::FormBuilderMethods
  include ActionView::RecordIdentifier
  include SimpleForm::ActionViewExtensions::FormHelper
  include ActionView::Helpers::FormOptionsHelper

  self.classes = ["box", "large-3", "columns"]

  def show
    render
  end
end
