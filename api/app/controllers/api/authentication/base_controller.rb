module Api
  module Authentication
    class BaseController < ApplicationController
      before_action :authenticate_user!

      private

      # def authenticate_user!
      #   token = request.headers['Authorization']&.split(' ')&.last
      #   return render json: { error: 'Token not provided' }, status: :unauthorized unless token

      #   begin
      #     decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      #     @current_user = User.find(decoded_token['user_id'])
      #   rescue JWT::DecodeError
      #     render json: { error: 'Invalid token' }, status: :unauthorized
      #   end
      # end
    end
  end
end
