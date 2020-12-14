require 'test_helper'
require 'date'
class CardTest < ActiveSupport::TestCase

  test "valid card test" do
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

    card = Card.new
    card.card_table = card_table
    card.name = "Example"
    card.completed = false
    card.description = "Test"
    card.priority = 0
    card.due_date = Date.tomorrow.to_s
    assert card.save
  end

  test "no card table id" do
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
    card_table.board_id = 1
    card_table.column_index = 0
    card_table.name = "Example"

    card_table.save

    card = Card.new
    card.name = "Example"
    card.completed = false
    card.description = "Test"
    card.priority = 0
    card.due_date = Date.tomorrow.to_s

    # assert_raise do
    assert_not card.save
    # end
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
    card_table.board_id = 1
    card_table.column_index = 0
    card_table.name = "Example"

    card_table.save

    card = Card.new
    card.card_table = card_table
    card.completed = false
    card.description = "Test"
    card.priority = 0
    card.due_date = Date.tomorrow.to_s

    assert_raise do
      card.save
    end
  end

  test "no completed" do
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
    card_table.board_id = 1
    card_table.column_index = 0
    card_table.name = "Example"

    card_table.save

    card = Card.new
    card.card_table = card_table
    card.name = "Example"
    card.description = "Test"
    card.priority = 0
    card.due_date = Date.tomorrow.to_s

    assert_raise do
      card.save
    end  
  end

  test "no priority" do
    user = User.new
    user.email = "example@example.com"
    user.password = "password"

    user.save

    board = Board.new
    board.name = "Example"
    board.user = user
    # board.user = user
    board.color = "green"
    
    board.save!

    card_table = CardTable.new
    card_table.board_id = 1
    card_table.column_index = 0
    card_table.name = "Example"

    card_table.save

    card = Card.new
    card.card_table = card_table
    card.name = "Example"
    card.completed = false
    card.description = "Test"
    card.due_date = Date.tomorrow.to_s

    assert_raise do
      card.save
    end
  end

  test "no due date" do
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
    card_table.board_id = 1
    card_table.column_index = 0
    card_table.name = "Example"


    card_table.save

    card = Card.new
    card.card_table = card_table
    card.name = "Example"
    card.completed = false
    card.description = "Test"
    card.priority = 0
    assert_raise do
      card.save
    end
  end

end
