class Git
  class Show < Trailblazer::Operation
    include CRUD
    # include Responder
    model Git, :find

    contract do
      property :url
      property :user_name
      property :repo_name
      property :oauth_token
      property :oauth_secret
      property :adapter
      property :type

      validate :is_a_git_repo?

      private

      def is_a_git_repo?
        if /([^\s\:]+)\s*\/\s*([^\s\.git]+)/.match(url).size != 3
          errors.add('url', 'Not a valid git url')
        end
      end
    end
  end

  class Create < Show
    action :create
    def process(params)
      @model = Git.create(params[:git])
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
      Git.all
    end
  end # index
end
