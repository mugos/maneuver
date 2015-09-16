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

    builds -> (params) do
      # TODO: ASSYNC THIS
      Build::Git.sync(params)
    end

    def model!
      Build.all
    end
  end # index

  class Git
    def self.sync(params)
      @app = App.find(params[:app_id])
      @host = Host.find(params[:host_id])

      git = @app.git

      git.list_commits do |commit|
        # Create new based on commit
        pp '--------------'
        pp commit
        pp '--------------'
      end
      abort
    end
  end # Git sync
end
