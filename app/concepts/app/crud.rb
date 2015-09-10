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

      # collection :hosts, prepopulator: :prepopulate_hosts!, populate_if_empty: :populator_hosts! do
      #   property :id
      # end

      collection :hosts, prepopulator: :prepopulate_hosts!, populate_if_empty: :populator_hosts! do
        property :id
        property :name
      end

      validates :name, length: { in: 1..30 }
      validate :git_repo?

      private
      def prepopulate_hosts!(options)
        ap '---------------- PREPOPULATOR'
        pp hosts
        ap '-----------------'
        # self.hosts << Host.new
      end

      def populator_hosts!(params, options)
        # pp '---------------- POPULATOR'
        # pp params
        # pp params[:id]
        # pp params[:id].reject!(&:blank?)
        # pp '===================='
        self.hosts << Host.find(params[:id])
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
      pp 'params in process ==============='
      pp params
      pp '=================================='
      abort
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
