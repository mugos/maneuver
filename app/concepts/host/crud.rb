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

      # TODO: Validate if is a valid ssh
      property :key,
        # populate_if_empty: -> (fragment, *) { self.key =  Key.new } do
        prepopulator: -> (*) { self.key = Key.new },
        populator: -> (fragment, *) { self.key = Key.find(fragment[:id]) || Key.new } do

        property :name
        # Validates if valid ssh key
        property :value
      end
    end

    def key
      model.key
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
