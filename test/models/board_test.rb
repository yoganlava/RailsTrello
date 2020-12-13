require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  test "successful board creation" do 
    board = Board.new
    board.name = "Example"
    board.creator_id = 1
    board.color = "green"
    
    board.save
    assert board.valid?
  end

  test "no name" do
    board = Board.new
    board.creator_id = 1
    board.color = "green"
    
    board.save
    refute assert board.valid?
  end

  test "no creator id" do
    board = Board.new
    board.name = "Example"
    board.color = "green"
    
    board.save
    refute assert board.valid?
  end

  test "no colour" do 
    board = Board.new
    board.name = "Example"
    board.creator_id = 1
    
    board.save
    refute board.valid?
  end
end
