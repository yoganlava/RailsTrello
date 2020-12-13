require 'test_helper'
require 'date'
class CardTest < ActiveSupport::TestCase

  test "valid card test" do
    card = Card.new
    card.parent_id = 1
    card.name = "Example"
    card.completed = false
    card.description = "Test"
    card.priority = 0
    card.due_date = Date.tomorrow.to_s

    card.save
    assert card.valid?
  end

  test "no parent id" do
    card = Card.new
    card.name = "Example"
    card.completed = false
    card.description = "Test"
    card.priority = 0
    card.due_date = Date.tomorrow.to_s

    card.save
    refute card.valid?
  end

  test "no name" do
    card = Card.new
    card.parent_id = 1
    card.completed = false
    card.description = "Test"
    card.priority = 0
    card.due_date = Date.tomorrow.to_s

    card.save
    refute card.valid?
  end

  test "no completed" do
    card = Card.new
    card.parent_id = 1
    card.name = "Example"
    card.description = "Test"
    card.priority = 0
    card.due_date = Date.tomorrow.to_s

    card.save
    refute card.valid?
  end

  test "no priority" do
    card = Card.new
    card.parent_id = 1
    card.name = "Example"
    card.completed = false
    card.description = "Test"
    card.due_date = Date.tomorrow.to_s

    card.save
    refute card.valid?
  end

  test "no due date" do
    card = Card.new
    card.parent_id = 1
    card.name = "Example"
    card.completed = false
    card.description = "Test"
    card.priority = 0

    card.save
    refute card.valid?
  end

end
