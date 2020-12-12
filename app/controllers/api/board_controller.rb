module Api
  class BoardController < ApplicationController
    before_action :authenticate_user, only: [:new, :create, :update, :get_user_boards]

    def show
      board = Board.find_by(id: params[:id])
      if board.nil?
        board = Board.find_by(custom_url: params[:id])
        if board.nil?
          render json: {error: "No board found"}
          return
        end
      end
      render json: board
      return
    end

    def save_board
      params[:_json].each do |table|
        if table[:id].nil?
          card_table = CardTable.new({name: table[:name], column_index: table[:column_index], board_id: table[:board_id]})
          card_table.save
          table[:id] = card_table.id
        else
          board = CardTable.find_by(id: table[:id])
          board.update({name: table[:name], column_index: table[:column_index], board_id: table[:board_id]})
        end
        table[:cards].each do |card|
          if card[:id].nil?
            saved_card = Card.new({parent_id: table[:id], name: card[:name], completed: card[:completed], description: card[:description], priority: card[:priority], due_date: card[:due_date]})
            saved_card.save
          else
            saved_card = Card.find_by(id: card[:id])
            saved_card.update({parent_id: table[:id], name: card[:name], completed: card[:completed], description: card[:description], priority: card[:priority], due_date: card[:due_date]})
          end
        end
      end
    end

    def add_access
      user = User.find_by(email: params[:email])
      puts "USER"
      puts user
      puts "USER END"
      if user.nil?
        render json: {error: "No user found under that email"}
        return
      end
      board = Board.find(params[:board_id].to_i)
      if board.nil?
        render json: {error: "Invalid board id"}
        return
      end
      if board.creator.eql? user.id
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

    def create
      args = board_params
      args["creator"] = current_user.id
      @board = Board.new(args)

      begin
        @board.save
        render json: {message: "Board created"}
      rescue Exception => e
        render json: {error: "Try another name"}
      end
    end

    def delete_board
      if !current_user.id.eql? params[:creator]
        render json: {error: "Insufficient permissions"}
        return
      end
      Board.destroy(params[:id])
      render json: {message: "Board deleted"}
    end

    private

    def board_params
      params.require(:board).permit(:name, :custom_url, :color, :image, :private)
    end

  end
end
