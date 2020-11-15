require "application_system_test_case"

class UserTest < ApplicationSystemTestCase
  setup do
    @user = user(:one)
  end

  test "visiting the index" do
    visit user_url
    assert_selector "h1", text: "User"
  end

  test "creating a User" do
    visit user_url
    click_on "New User"

    fill_in "Created at", with: @user.created_at
    fill_in "Email", with: @user.email
    fill_in "Id", with: @user.id
    fill_in "Password", with: @user.password
    fill_in "Updated at", with: @user.updated_at
    fill_in "Username", with: @user.username
    check "Verified" if @user.verified
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit user_url
    click_on "Edit", match: :first

    fill_in "Created at", with: @user.created_at
    fill_in "Email", with: @user.email
    fill_in "Id", with: @user.id
    fill_in "Password", with: @user.password
    fill_in "Updated at", with: @user.updated_at
    fill_in "Username", with: @user.username
    check "Verified" if @user.verified
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit user_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
