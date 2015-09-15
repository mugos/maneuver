class Build
  class Show < Trailblazer::Operation
    include CRUD

    model Build, :find

    contract do

      property :state
      property :completed_at
      property :type

      property :app,
          prepopulator: ->(*) { self.app = model.app || App.new },
          populator: ->(fragment, model, options) { model || self.app = App.find_by_id(fragment[:id]) || App.new } do
        property :id
      end

      property :host,
          prepopulator: ->(*) { self.host = model.host || Host.new },
          populator: ->(fragment, model, options) { model || self.host = Host.find_by_id(fragment[:id]) || Host.new } do
        property :id
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
      Build.all
    end
  end # index
end
