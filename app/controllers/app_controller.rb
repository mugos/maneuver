class AppsController  < ApplicationController
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

  def create_comment
    present App::Show
    @op = @operation # FIXME.

    run App::Create do |op| # overrides @model and @form!
      flash[:notice] = "Created comment for \"#{op.app.name}\""
      return redirect_to app_path(op.app)
    end

    render :show
  end

  def edit
    puts "edit: @@@@??@ #{params.inspect}"

    form App::Update

    @form.prepopulate!

    render_form
  end

  def update
    # require "pp"
    # pp App::Update.contract_class.object_representer_class.representable_attrs
    run App::Update do |op|
      return redirect_to op.model
    end

    # @form.prepopulate!
    render action: :new
  end

  # TODO: test me.
  def destroy
    run App::Delete do |op|
      flash[:notice] = "#{op.model.name} deleted."
      return redirect_to root_path
    end
  end


  protect_from_forgery except: :next_comments # FIXME: this is only required in the test, apps_controller_test.
  def next_comments
    present App::Show

    render js: concept("comment/cell/grid", @app, page: params[:page]).(:append)
  end

  private

  def render_form
    # raise @operation.class.inspect
    render text: concept("app/cell/form", @form,
        admin: (@operation.is_a? App::Update::Admin or @operation.is_a? App::Create::Admin),
        signed_in: tyrant.signed_in?),
        layout: true
  end
end
