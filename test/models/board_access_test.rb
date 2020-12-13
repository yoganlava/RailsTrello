require 'test_helper'

class BoardAccessTest < ActiveSupport::TestCase

  test "valid access creation" do 
    board_access = BoardAccess.new
    board_access.user_id = 1
    board_access.board_id = 1

    board_access.save
    assert board_access.valid?
  end

  test "invalid access creation" do
    board_access1 = BoardAccess.new
    board_access1.user_id = 1
    board_access1.board_id = 1

    board_access1.save
    assert board_access1.valid?
    
    board_access2 = BoardAccess.new
    board_access2.user_id = 1
    board_access2.board_id = 1

    board_access2.save
    refute board_access2.valid?
  end

end
