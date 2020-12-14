module Api
  class CardController < ApplicationController
    # before_action :authenticate_user
    # before_action :set_card, only: [:show, :edit, :update, :destroy]
    skip_before_action :verify_authenticity_token

    def get_cards
      cards = Card.where(card_table_id: params[:id]).order(:priority)
      render json: cards
      return
    end

    def delete_cards
      params[:_json].each do |card|
        if card[:id].nil?
          Card.destroy(card[:id])
        end
      end
    end

  end
end
