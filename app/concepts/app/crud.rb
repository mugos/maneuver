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

      validates :name, length: { in: 6..160 }
      validate :git_repo?

      private

      def git_repo?
        if git =~ URI::regexp
            true
        else
          errors.add("git", "is invalid")
        end
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
      App.all
    end
  end # index
end
