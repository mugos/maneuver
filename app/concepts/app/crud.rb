class App
  class Show < Trailblazer::Operation
    include CRUD

    model App, :find

    contract do
      property :name
      property :git
      property :group

      # PREPOPULATORS are a concept designed to prepare a form for rendering,
      # whereas POPULATORS are meant to set up the form in *validate when the input hash is deserialized.
      collection :hosts,
          populator: ->(fragment, collection, index, options) { (item = collection[index]) ? item : collection.insert(index, Host.find(fragment[:id])) } do
        property :id
        property :name
      end

      property :git,
          prepopulator: ->(*) { self.git = model.git || Git.new },
          populator: ->(fragment, model, options) { model || self.git = Git.find_by_id(fragment[:id]) || Git.new } do
        property :id
        property :url
        property :api_key
        property :type
      end
    end
  end

  class Create < Show
    action :create

    def process(params)
      validate(params[:app]) do |f|
        f.save
      end
    end

    private
    def setup_params!(params)
      # TODO: not sure if this should be here either
      return unless params[:app]

      # TODO: Search the right way of doing this
      # It trows a error if there is no key
      params[:app][:hosts] = params[:app][:hosts].map{ |id| {id: id} unless id.blank? }.compact!
    end
  end

  class Update < Create
    action :update

    def process(params)
      # TODO: Is this the right thing
      # This is here becase populator does not remove from relation
      model.hosts = []

      validate(params[:app]) do |f|
        f.save
      end
    end
  end

  class Destroy < Update
    def process(params)
      @model.destroy!
    end
  end

  class Index < Trailblazer::Operation
    include Collection

    def model!(params)
      App.all
    end
  end # index
end
