module Api
  class BoardAccessController < ApplicationController
    before_action :authenticate_user
    skip_before_action :verify_authenticity_token

    def add_access
      user = User.find_by(email: params[:email])
      if user.nil?
        render json: {error: "No user found under that email"}
        return
      end
      board = Board.find(params[:board_id].to_i)
      if board.nil?
        render json: {error: "Invalid board id"}
        return
      end
      if board.user_id.eql? user.id
        render json: {error: "User is creator"}
        return
      end
      access = BoardAccess.new({user_id: user.id, board_id: board.id})
      begin
        access.save
        render json: {message: "User added"}
      rescue Exception => e
        render json: {error: "User already added"}
      end
    end

    def has_access
      board_access = BoardAccess.find_by(user_id: current_user.id, board_id: params[:board_id])
      if board_access.nil?
        board = Board.find(params[:board_id])
        if !board.user_id.eql? current_user.id
          render json: {error: "User has no access"}
          return false
        end
      end
      return true
    end
  end
end
