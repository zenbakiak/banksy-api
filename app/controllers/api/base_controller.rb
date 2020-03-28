# frozen_string_literal: true

module Api
  class BaseController < ActionController::API
    include ActionController::Helpers

    before_action :verify_jwt_authentication

    attr_accessor :current_user

    def render_unauthorized
      render json: { message: 'Unauthorized user' }, status: :unauthorized
    end

    def render_not_found
      render(json: { status: 500, errors: ['Record not found'] }) && return
    end

    private

    # get auth header and verify if it is a valid JWT
    def verify_jwt_authentication
      render_unauthorized && return unless auth_header
      begin
        @current_user = User.verify_sign(token)
        User.current = @current_user
      rescue StandardError => e
        # It is important to log this action.
        Rails.logger.info e
        render_unauthorized
      end
    end

    def auth_header
      request.headers['Authorization']
    end

    def token
      auth_header.split(' ').last
    end
  end
end
