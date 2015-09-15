class BuildsController < ApplicationController
  respond_to :html

  def index
    @app = App.find(params[:app_id])
    @host = Host.find(params[:host_id])

    collection Build::Index
    @cell = "build/cell"
  end

  def new
    form Build::Create
    @form.prepopulate!

    render_form
  end

  def create
    run Build::Create do |op|
      return redirect_to op.model
    end

    @form.prepopulate!
    render_form
  end

  def show
    present Build::Show
    @op = @operation # FIXME.

    form Build::Create # overrides @model and @form!
    @form.prepopulate!
  end

  def edit
    form Build::Update

    @form.prepopulate!

    render_form
  end

  def update
    run Build::Update do |op|
      return redirect_to op.model
    end

    # @form.prepopulate!
    render action: :new
  end

  # TODO: test me.
  def destroy
    run Build::Destroy do |op|
      flash[:notice] = "#{op.model.name} deleted."
      return redirect_to root_path
    end
  end

  private

  def render_form
    render text: concept("build/cell/form", @operation), layout: true
  end
end
