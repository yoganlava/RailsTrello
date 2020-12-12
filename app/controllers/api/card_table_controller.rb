module Api
  class CardTableController < ApplicationController
    # before_action :authenticate_user
    before_action :set_card_table, only: [:show, :edit, :update, :destroy]

    def get_card_tables
      tables = CardTable.where(board_id: params[:id]).order(:column_index)
      if tables == nil
        render json: {error: "No card tables"}, status: 404
        return
      end
      render json: tables, status: 200
      return
    end

    def delete_tables
      params[:_json].each do |table|
        puts table[:id]
        if !table[:id].nil?
          CardTable.destroy(table[:id])
        end
      end
    end
  end
end