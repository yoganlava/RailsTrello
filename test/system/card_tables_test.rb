require "application_system_test_case"

class CardTablesTest < ApplicationSystemTestCase
  setup do
    @card_table = card_tables(:one)
  end

  test "visiting the index" do
    visit card_tables_url
    assert_selector "h1", text: "Card Tables"
  end

  test "creating a Card table" do
    visit card_tables_url
    click_on "New Card Table"

    fill_in "Column index", with: @card_table.column_index
    fill_in "Name", with: @card_table.name
    click_on "Create Card table"

    assert_text "Card table was successfully created"
    click_on "Back"
  end

  test "updating a Card table" do
    visit card_tables_url
    click_on "Edit", match: :first

    fill_in "Column index", with: @card_table.column_index
    fill_in "Name", with: @card_table.name
    click_on "Update Card table"

    assert_text "Card table was successfully updated"
    click_on "Back"
  end

  test "destroying a Card table" do
    visit card_tables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Card table was successfully destroyed"
  end
end
