class Board < ApplicationRecord

    belongs_to :user
    has_many :card_tables
end
