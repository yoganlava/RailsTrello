module Api
  class BoardController < ApplicationController
    before_action :authenticate_user, only: [:new, :create, :update, :get_user_boards]
    # before_action :set_board, only: [:show, :edit, :update, :destroy]

    # GET /boards
    # GET /boards.json
    def index
      @boards = Board.all
    end

    # GET /boards/1
    # GET /boards/1.json
    def show
      board = Board.find_by(id: params[:id])
      if board == nil
        render json: {error: "No board found"}, status: 404
        return
      end
      render json: board, status: 200
      return
    end

    def save_board
      # puts params[:_json]
      params[:_json].each do |table|
        puts "########################################TABLE##################################################################"
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

    def delete_tables

      params[:_json].each do |table|
        puts table[:id]
        if !table[:id].nil?
          puts "delete"
          CardTable.destroy(table[:id])
        end
      end
    end

    def delete_cards
      params[:_json].each do |card|
        if card[:id].nil?
          Card.destroy(card[:id])
        end
      end
    end

    # GET /boards/new
    def new
      @board = Board.new
    end

    def get_user_boards
      board = Board.where(creator: current_user.id)
      render json: board
    end


    # GET /boards/1/edit
    def edit
    end

    # POST /boards
    # POST /boards.json
    def create
      args = board_params
      args["creator"] = current_user.id
      @board = Board.new(args)

      begin
        @board.save
        render json: {message: "Board created"}, status: 200
      rescue Exception => e
        render json: {error: "Try another name"}, status: 200
      end
    end

    # PATCH/PUT /boards/1
    # PATCH/PUT /boards/1.json
    def update
      respond_to do |format|
        if @board.update(board_params)
          format.html { redirect_to @board, notice: 'Board was successfully updated.' }
          format.json { render :show, status: :ok, location: @board }
        else
          format.html { render :edit }
          format.json { render json: @board.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /boards/1
    # DELETE /boards/1.json
    def destroy
      @board.destroy
      respond_to do |format|
        format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    # def set_board
    #   @board = Board.find(params[:id])
    # end

    def board_params
      params.require(:board).permit(:name, :custom_url, :color, :image, :private)
    end

  end
end
