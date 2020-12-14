module Api
  class CardTableController < ApplicationController
    before_action :set_card_table, only: [:show, :edit, :update, :destroy]
    skip_before_action :verify_authenticity_token
    
    #  get card tables and render as json
    def get_card_tables
      tables = CardTable.where(board_id: params[:id]).order(:column_index)
      render json: tables
      return
    end
    # delete card tables if they have id
    def delete_tables
      params[:_json].each do |table|
        if !table[:id].nil?
          CardTable.destroy(table[:id])
        end
      end
    end
  end
end