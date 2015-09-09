class AppsController < ApplicationController
  respond_to :html

  def index
    collection App::Index
    @cell = "app/cell"
  end

  def new
    form App::Create
    @form.prepopulate!

    render_form
  end

  def create
    run App::Create do |op|
      return redirect_to op.model
    end

    @form.prepopulate!
    render_form
  end

  def show
    present App::Show
    @op = @operation # FIXME.

    form App::Create # overrides @model and @form!
    @form.prepopulate!
  end

  def edit
    form App::Update

    @form.prepopulate!

    render_form
  end

  def update
    run App::Update do |op|
      return redirect_to op.model
    end

    # @form.prepopulate!
    render action: :new
  end

  # TODO: test me.
  def destroy
    run App::Destroy do |op|
      flash[:notice] = "#{op.model.name} deleted."
      return redirect_to root_path
    end
  end

  private

  def render_form
    render text: concept("app/cell/form", @operation), layout: true
  end
end
