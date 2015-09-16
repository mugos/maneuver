include Trailblazer::Operation::Dispatch
class Build
  class Show < Trailblazer::Operation
    include CRUD

    model Build, :find

    contract do
      property :state

      property :app,
          prepopulator: ->(options) { self.app = model.app || App.find_by_id(options[:app_id]) },
          populator: ->(fragment, model, options) { model || self.app = App.find_by_id(fragment[:id]) || App.new } do
        property :id
        property :name
        property :build_type, virtual: true
      end

      property :host,
          prepopulator: ->(options) { self.host = model.host || Host.find_by_id(options[:host_id]) },
          populator: ->(fragment, model, options) { model || self.host = Host.find_by_id(fragment[:id]) || Host.new } do
        property :id
        property :name
        property :build_type, virtual: true
      end
    end
  end

  class Create < Show
    action :create

    def process(params)
      validate(params[:build]) do |f|
        build_type = params[:build][:build_type]
        f.sync
        pp '--------'
        pp f.model
        pp f.model.app
        pp f.model.host
        pp '--------'
        abort
        # f.save
      end
    end
  end

  class Index < Trailblazer::Operation
    include Collection

    def model!(params)
      Build.all
    end
  end # index
end
