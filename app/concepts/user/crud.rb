class User < ActiveRecord::Base
  class Create < Trailblazer::Operation
    include CRUD
    model User, :create

    def process(params)
      @model = User.create(params[:user])
    end
  end

  class Index < Trailblazer::Operation
    include Collection

    def model!(params)
      User.all
    end
  end
end
