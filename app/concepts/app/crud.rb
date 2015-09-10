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

      collection :hosts, populate_if_empty: :populator_hosts!, skip_if: :all_blank do
        property :id
        property :name
      end

      validates :name, length: { in: 1..30 }
      validate :git_repo?

      private

      def populator_hosts!(params, options)
        Host.find(params[:id]) || Host.new
      end

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
      # TODO Search the right way of doing this
      # It trows a error if there is no key
      params[:app][:hosts] = params[:app][:hosts].map{ |id| {id: id} unless id.blank? }.compact!

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
