require 'uri'

class App
  class Show < Trailblazer::Operation
    include CRUD

    model App, :find

    contract do
      property :name
      property :git
      property :script

      # , populate_if_empty: Host, skip_if: :all_blank
      collection :hosts, populator: :populator_hosts! do
        property :id
        property :name
      end

      private

      def populator_hosts!(params, options)
        pp '---------- 2'
        pp params
        pp options
        pp '---------- 2'
        Host.find(params[:id]) || Host.new
      end
    end
  end

  class Create < Show
    action :create

    def process(params)
      # TODO Search the right way of doing this
      # It trows a error if there is no key
      params[:app][:hosts] = params[:app][:hosts].map{ |id| {id: id} unless id.blank? }.compact!

      pp '---------- 1'
      pp params
      pp '---------- 1'

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
