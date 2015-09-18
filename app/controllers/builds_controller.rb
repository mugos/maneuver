class BuildsController < ApplicationController
  respond_to :html

  def index
    collection Build::Index
    @cell = "build/cell"
  end

  def new
    @app = App.find(params[:app_id])
    @host = Host.find(params[:host_id])

    form Build::Create
    @form.prepopulate!(params)
    render_form
  end

  def create
    run Build::Create do |op|
      return redirect_to op.model
    end

    @form.prepopulate!(params)
    render_form
  end

  def show
    present Build::Show
    @op = @operation # FIXME.

    form Build::Create # overrides @model and @form!
    @form.prepopulate!
  end

  private

  def render_form
    render text: concept("build/cell/form", @operation), layout: true
  end
end
