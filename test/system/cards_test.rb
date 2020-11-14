require "application_system_test_case"

class CardsTest < ApplicationSystemTestCase
  setup do
    @card = cards(:one)
  end

  test "visiting the index" do
    visit cards_url
    assert_selector "h1", text: "Cards"
  end

  test "creating a Card" do
    visit cards_url
    click_on "New Card"

    check "Completed" if @card.completed
    fill_in "Description", with: @card.description
    fill_in "Due date", with: @card.due_date
    fill_in "Name", with: @card.name
    fill_in "Parent", with: @card.parent_id
    fill_in "Priority", with: @card.priority
    click_on "Create Card"

    assert_text "Card was successfully created"
    click_on "Back"
  end

  test "updating a Card" do
    visit cards_url
    click_on "Edit", match: :first

    check "Completed" if @card.completed
    fill_in "Description", with: @card.description
    fill_in "Due date", with: @card.due_date
    fill_in "Name", with: @card.name
    fill_in "Parent", with: @card.parent_id
    fill_in "Priority", with: @card.priority
    click_on "Update Card"

    assert_text "Card was successfully updated"
    click_on "Back"
  end

  test "destroying a Card" do
    visit cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Card was successfully destroyed"
  end
end
