module Api
  class UserController < ApplicationController
    before_action :authenticate_user, only: [:get_user_info]
    skip_before_action :verify_authenticity_token

    # Get user info as json. Used in frontend to verify if user is logged in
    def get_user_info
      user = User.select(:email, :created_at).find_by(id: current_user.id)
      render json: user
    end


    # create user if email matches regex
    def create
      if not !!(user_params["email"] =~ /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
        render json: {error: "Invalid email"}, status: 200
        return
      end
      @user = User.new(user_params)

      begin
        @user.save
        render json: {message: "User created"}, status: 200
      rescue Exception => e
        render json: {error: "Try another email"}, status: 200
      end
    end

    # get boards owned by user
    def get_user_boards
      board = Board.where(user_id: current_user.id)
      render json: board
    end

    # get boards shared to the user
    def get_shared_boards
      boards = BoardAccess.where(user_id: current_user.id)
      render json: boards.map {|access| Board.find(access.board_id)}
    end

    private
      def user_params
        params.require(:user).permit(:id, :email, :password)
      end
  end
end