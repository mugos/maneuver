require 'uri'

class App
  class Show < Trailblazer::Operation
    include CRUD

    # include Responder
    model App, :find

    contract do
      # include Reform::Form::ModelReflections

      property :name
      property :git
      property :script

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
        property :oauth_token
        property :oauth_secret
        property :client_id
        property :client_secret
        property :adapter
        property :repo_type
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

    def setup_model!(params)
      # TODO: not sure if this should be here either
      return unless params[:app]

      # TODO: Is this the right thing
      # This is here becase populator does not remove from relation
      model.hosts = []
    end

    def setup_params!(params)
      # TODO: Search the right way of doing this
      # It trows a error if there is no key
      params[:app][:hosts] = params[:app][:hosts].map{ |id| {id: id} unless id.blank? }.compact!
    end
  end

  class Update < Create
    action :update
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
