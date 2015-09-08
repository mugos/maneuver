class KeysController < ApplicationController
  respond_to :html

  def index
    collection Key::Index
    @cell = "key/cell"
  end

  def new
    form Key::Create
    @form.prepopulate!

    render_form
  end

  def create
    run Key::Create do |op|
      return redirect_to op.model
    end

    @form.prepopulate!
    render_form
  end

  def show
    present Key::Show
    @op = @operation # FIXME.

    form Key::Create # overrides @model and @form!
    @form.prepopulate!
  end

  def edit
    form Key::Update

    @form.prepopulate!

    render_form
  end

  def update
    run Key::Update do |op|
      return redirect_to op.model
    end

    # @form.prepopulate!
    render action: :new
  end

  # TODO: test me.
  def destroy
    run Key::Destroy do |op|
      flash[:notice] = "#{op.model.name} deleted."
      return redirect_to root_path
    end
  end

  private

  def render_form
    render text: concept("key/cell/form", @form), layout: true
  end
end
