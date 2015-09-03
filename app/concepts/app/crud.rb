require 'uri'

class App < ActiveRecord::Base
  class Create < Trailblazer::Operation
    include CRUD
    model App, :create

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

    def process(params)
      validate(params[:app]) do |f|
        f.save # save comment and user.
      end
    end
  end # Create

  class Update < Create
    model App, :update
  end # Update

  class Show < Trailblazer::Operation
    include CRUD
    model App, :find
  end

  class Index < Trailblazer::Operation
    include Collection

    def model!(params)
      App.all
    end
  end # index
end
