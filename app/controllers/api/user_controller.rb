module Api
  class UserController < ApplicationController
    before_action :authenticate_user, only: [:get_user_info]
    # before_action :set_user, only: [:show, :edit, :update, :destroy]

    def get_user_info
      user = User.select(:email, :created_at).find_by(id: current_user.id)
      render json: user
    end

    # POST /users
    # POST /users.json
    def create
      if not !!(user_params["email"] =~ /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
        render json: {error: "Invalid email"}, status: 200
        return
      end
      user_params["verified"] = 0
      @user = User.new(user_params)

      begin
        @user.save
        render json: {message: "User created"}, status: 200
      rescue Exception => e
        render json: {error: "Try another email"}, status: 200
      end

    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        # @user = User.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:id, :email, :password)
      end
  end
end