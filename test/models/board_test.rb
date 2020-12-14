require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  test "successful board creation" do 
    user = User.new
    user.email = "example@example.com"
    user.password = "password"

    user.save

    board = Board.new
    board.name = "Example"
    board.user = user
    board.color = "green"
    
    board.save
    assert board.valid?
  end

  test "no name" do
    user = User.new
    user.email = "example@example.com"
    user.password = "password"

    user.save

    board = Board.new
    board.user = user
    board.color = "green"
    
    assert_raise do
      board.save
    end
  end

  test "no creator id" do
    user = User.new
    user.email = "example@example.com"
    user.password = "password"

    user.save

    board = Board.new
    board.name = "Example"
    board.color = "green"
    
    assert_not board.save
    
  end

  test "no colour" do 
    user = User.new
    user.email = "example@example.com"
    user.password = "password"

    user.save

    board = Board.new
    board.name = "Example"
    board.user = user
    
    assert_raise do
      board.save
    end
  end
end
