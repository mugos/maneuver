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

      property :key, prepopulator: :prepopulate_key!, populate_if_empty: :populator_key! do
        property :id
        property :name
      end

      private

      def prepopulate_key!(options)
        self.key = Key.new
      end

      def populator_key!(params, options)
        Key.find(params[:id]) || Key.new
      end
    end
  end

  class Create < Show
    action :create

    def process(params)
      # TODO Search the right way of doing this
      # It trows a error if there is no key
      # Little hack till i can't figure out how to send things nested
      params[:host][:key] = { id: params[:host][:key] }

      pp '-----------'
      pp params
      pp '-----------'

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
