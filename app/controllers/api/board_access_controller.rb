module Api
  class BoardAccessController < ApplicationController
    before_action :authenticate_user

    def has_access
      board_access = BoardAccess.find_by(user_id: current_user.id, board_id: params[:board_id])
      if board_access.nil?
        board = Board.find(params[:board_id])
        if !board.creator.eql? current_user.id
          render json: {error: "User has no access"}
          return false
        end
      end
      return true
    end
  end
end
