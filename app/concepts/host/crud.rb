class Host
  class Show < Trailblazer::Operation
    include CRUD
    # include Responder
    model Host, :find

    contract do
      # include Reform::Form::ModelReflections

      # Name of the host
      property :name
      # System User
      property :sys_user
      # Place to ssh to
      # TODO: Validade ssh, with a test connection
      property :address
      # Folder to clone to
      property :source
      # For authentication
      validates :name, presence: true

      property :key,
          prepopulator: ->(*) { self.key = model.key || Key.new },
          populator: ->(fragment, model, options) { model || self.key = Key.find_by_id(fragment[:id]) || Key.new } do
        property :id
        property :name
      end
    end
  end

  class Create < Show
    action :create

    def process(params)
      validate(params[:host]) do |f|
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
      Host.all
    end
  end # index
end
