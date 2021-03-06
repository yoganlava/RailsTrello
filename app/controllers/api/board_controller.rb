module Api
  class BoardController < ApplicationController
    before_action :authenticate_user, only: [:new, :create, :update, :get_user_boards]
    skip_before_action :verify_authenticity_token


    # return board as json
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


    # Save board by looping throught json array of card tables and then looping through their own respective cards
    # If they have no id, create a card/cardtable; however, if they have and id, do an update
    def save_board
      if params[:_json].nil?
        render json: {error: "Invalid parameters"}
        return
      end
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
            saved_card = Card.new({card_table_id: table[:id], name: card[:name], completed: card[:completed], description: card[:description], priority: card[:priority], due_date: card[:due_date]})
            saved_card.save
          else
            saved_card = Card.find_by(id: card[:id])
            saved_card.update({card_table_id: table[:id], name: card[:name], completed: card[:completed], description: card[:description], priority: card[:priority], due_date: card[:due_date]})
          end
        end
      end
    end

    # Create a board using params supplied by front end
    def create
      args = board_params
      args["user_id"] = current_user.id
      # Simple validation
      if args["user_id"].nil? or args["name"].nil? or args["color"].nil? or args["custom_url"].nil?
        render json: {error: "Invalid parameters"}
        return
      end
      board = Board.new(args)

      begin
        board.save
        render json: {message: "Board created"}
      rescue Exception => e
        puts e
        render json: {error: "Try another name or custom url"}
      end
    end


    # Deletes board if user is creator
    def delete_board
      if params[:user_id].nil?
        render json: {error: "Invalid parameters"}
        return
      end
      if !current_user.id.eql? params[:user_id]
        render json: {error: "Insufficient permissions"}
        return
      end
      Board.destroy(params[:id])
      render json: {message: "Board deleted"}
    end

    private

    def board_params
      params.require(:board).permit(:name, :custom_url, :color, :image)
    end

  end
end
