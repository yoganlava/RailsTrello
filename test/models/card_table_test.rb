require 'test_helper'

class CardTableTest < ActiveSupport::TestCase
  test "valid card table" do
    user = User.new
    user.email = "example@example.com"
    user.password = "password"

    user.save

    board = Board.new
    board.name = "Example"
    board.user = user
    board.color = "green"
    
    board.save

    card_table = CardTable.new
    card_table.board = board
    card_table.column_index = 0
    card_table.name = "Example"

    card_table.save
    assert card_table.valid?
  end

  test "no board id" do
    user = User.new
    user.email = "example@example.com"
    user.password = "password"

    user.save

    board = Board.new
    board.name = "Example"
    board.user = user
    board.color = "green"
    
    board.save

    card_table = CardTable.new
    card_table.column_index = 0
    card_table.name = "Example"

    # assert_raise do
    assert_not card_table.save
    # end
  end

  test "no column index" do
    user = User.new
    user.email = "example@example.com"
    user.password = "password"

    user.save

    board = Board.new
    board.name = "Example"
    board.user = user
    board.color = "green"
    
    board.save

    card_table = CardTable.new
    card_table.board = board
    card_table.name = "Example"

    assert_raise do
      card_table.save
    end
  end
  
  test "no name" do
    user = User.new
    user.email = "example@example.com"
    user.password = "password"

    user.save

    board = Board.new
    board.name = "Example"
    board.user = user
    board.color = "green"
    
    board.save

    card_table = CardTable.new
    card_table.board = board
    card_table.column_index = 0

    assert_raise do
      card_table.save
    end
  end
end
