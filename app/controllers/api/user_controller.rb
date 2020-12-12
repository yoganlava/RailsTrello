module Api
  class UserController < ApplicationController
    before_action :authenticate_user, only: [:get_user_info]

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

    def get_user_boards
      board = Board.where(creator: current_user.id)
      render json: board
    end

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