module Api
  module Authentication
    class UsersController < BaseController
      before_action :load_users, only: [:index]
      skip_before_action :authenticate_user!, only: [:create]

      def index
        render json: @users.map { |user| UserSerializer.new(user).as_json }
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: { user: UserSerializer.new(user).as_json }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
      end

      def load_users
        @users = User.all
      end
    end
  end
end
