require 'test_helper'

class BoardAccessTest < ActiveSupport::TestCase

  test "valid access creation" do 
    user = User.new
    user.email = "example@example.com"
    user.password = "password"

    user.save

    board = Board.new
    board.name = "Example"
    board.user = user
    board.color = "green"
    
    board.save

    board_access = BoardAccess.new
    board_access.user = user
    board_access.board = board

    assert board_access.save
    # assert board_access.valid?
  end

  test "invalid access creation" do
    user = User.new
    user.email = "example@example.com"
    user.password = "password"

    user.save

    board = Board.new
    board.name = "Example"
    board.user = user
    board.color = "green"
    
    board.save

    board_access1 = BoardAccess.new
    board_access1.user = user
    board_access1.board = board

    board_access1.save
    
    board_access2 = BoardAccess.new
    board_access2.user = user
    board_access2.board = board

    assert_raise do
      board_access2.save
    end 
  end

end
