class CardTable < ApplicationRecord

    belongs_to :board
    has_many :cards

end
