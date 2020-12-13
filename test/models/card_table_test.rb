require 'test_helper'

class CardTableTest < ActiveSupport::TestCase
  test "valid card table" do
    card_table = CardTable.new
    card_table.board_id = 1
    card_table.column_index = 0
    card_table.name = "Example"

    card_table.save
    assert card_table.valid?
  end

  test "no board id" do
    card_table = CardTable.new
    card_table.column_index = 0
    card_table.name = "Example"

    card_table.save
    refute card_table.valid?
  end

  test "no column index" do
    card_table = CardTable.new
    card_table.board_id = 1
    card_table.name = "Example"

    card_table.save
    refute card_table.valid?
  end
  
  test "no name" do
    card_table = CardTable.new
    card_table.board_id = 1
    card_table.column_index = 0

    card_table.save
    refute card_table.valid?
  end
end
