# frozen_string_literal: true

module Api
  module V1
    class UsersController < BaseController
      skip_before_action :verify_jwt_authentication, only: :create

      def index
        users = User.all
        render json: UserSerializer.new(users).serialized_json
      end

      def show
        @user = User.find_by(username: params[:id])
        if @user
          render json: UserSerializer.new(@user).serialized_json
        else
          render_not_found
        end
      end

      # signup method
      def create
        @user = User.new(user_params)
        if @user.save
          render json: UserSessionSerializer.new(@user).serialized_json
        else
          render json: {
            errors: @user.errors.full_messages
          },
                 status: :unprocessable_entity
        end
      end

      private

      def user_params
        params
          .require(:user)
          .permit(
            :email,
            :first_name,
            :last_name,
            :password_confirmation,
            :password,
            :username
          )
      end
    end
  end
end
