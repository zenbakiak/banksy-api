module Api
  module V1
    class SessionsController < BaseController
      # skip jwt verification otherwise users will not be able to sign in
      skip_before_action :verify_jwt_authentication

      def create
        @user = User.find_by(email: session_params[:email])

        if @user && @user.authenticate(session_params[:password])
          render json: UserSessionSerializer.new(@user).serialized_json
        else
          render_unauthorized
        end
      end

      private

      def session_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
