require "application_system_test_case"

class BoardAccessesTest < ApplicationSystemTestCase
  setup do
    @board_access = board_accesses(:one)
  end

  test "visiting the index" do
    visit board_accesses_url
    assert_selector "h1", text: "Board Accesses"
  end

  test "creating a Board access" do
    visit board_accesses_url
    click_on "New Board Access"

    fill_in "Board", with: @board_access.board_id
    fill_in "User", with: @board_access.user_id
    click_on "Create Board access"

    assert_text "Board access was successfully created"
    click_on "Back"
  end

  test "updating a Board access" do
    visit board_accesses_url
    click_on "Edit", match: :first

    fill_in "Board", with: @board_access.board_id
    fill_in "User", with: @board_access.user_id
    click_on "Update Board access"

    assert_text "Board access was successfully updated"
    click_on "Back"
  end

  test "destroying a Board access" do
    visit board_accesses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Board access was successfully destroyed"
  end
end
