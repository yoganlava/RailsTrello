module Api
  class CardController < ApplicationController
    # before_action :authenticate_user
    # before_action :set_card, only: [:show, :edit, :update, :destroy]

    def get_cards
      cards = Card.where(parent_id: params[:id]).order(:priority)
      if cards == nil
        render json: {error: "No cards"}, status: 404
        return
      end
      render json: cards, status: 200
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
