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

      collection :hosts, populator: :populator_hosts!, populate_if_empty: Host, skip_if: :all_blank do
        property :id
        property :name
      end

      private

      def populator_hosts!(fragment, collection, index, options)
        pp '----------'
        pp fragment
        pp collection
        pp index
        pp options
        pp '----------'
        Host.find(fragment[:id]) || self.hosts << Host.new
      end
    end
  end

  class Create < Show
    action :create

    def process(params)
      # TODO Search the right way of doing this
      # It trows a error if there is no key
      params[:app][:hosts] = params[:app][:hosts].map{ |id| {id: id} unless id.blank? }.compact!

      pp params
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
