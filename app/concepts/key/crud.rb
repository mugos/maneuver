class Key
  class Show < Trailblazer::Operation
    include CRUD
    # include Responder
    model Key, :find

    contract do
      property :name
      property :value

      validates :name, presence: true
      validates :value, presence: true
    end
  end

  class Create < Show
    action :create

    def process(params)
      validate(params[:key]) do |f|
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
      Key.all
    end
  end # index
end
