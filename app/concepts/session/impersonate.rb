module Session
  class Impersonate < Trailblazer::Operation
    # DISCUSS: from here on, i'm assuming we will introduce a Context object or something
    # that keeps all that data (logged in, impersonate, params, session, etc.) but to
    # experiment, i use params, Scharrels. ;)
    def process(params)

      # TODO: different Op, this is what usually happens in #process_params!
      params[:current_user] = params[:tyrant].current_user



      # TODO: policy if admin!
      # don't access tyrant global anywhere.

      puts "@@@@@ #{params .inspect}"
      return unless params[:as]
      simulated = User.find_by!(email: params[:as])

      # @model = params[:current_user]
      params[:current_user] = simulated
      params[:real_user]    = params[:tyrant].current_user
      puts "??? after #{params.inspect}"
    end
  end
end
