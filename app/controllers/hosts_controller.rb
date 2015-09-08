class HostsController < ApplicationController
  respond_to :html

  def index
    collection Host::Index
    @cell = "host/cell"
  end

  def new
    form Host::Create
    @form.prepopulate!

    render_form
  end

  def create
    run Host::Create do |op|
      return redirect_to op.model
    end

    @form.prepopulate!
    render_form
  end

  def show
    present Host::Show
    @op = @operation # FIXME.

    form Host::Create # overrides @model and @form!
    @form.prepopulate!
  end

  def edit
    form Host::Update

    @form.prepopulate!

    render_form
  end

  def update
    run Host::Update do |op|
      return redirect_to op.model
    end

    # @form.prepopulate!
    render action: :new
  end

  # TODO: test me.
  def destroy
    run Host::Destroy do |op|
      flash[:notice] = "#{op.model.name} deleted."
      return redirect_to root_path
    end
  end

  private

  def render_form
    render text: concept("host/cell/form", @form), layout: true
  end
end
