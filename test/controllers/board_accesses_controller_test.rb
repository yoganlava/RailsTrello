require 'test_helper'

class BoardAccessControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board_access = board_access(:one)
  end

  test "should get index" do
    get board_access_url
    assert_response :success
  end

  test "should get new" do
    get new_board_access_url
    assert_response :success
  end

  test "should create board_access" do
    assert_difference('BoardAccess.count') do
      post board_access_url, params: { board_access: { board_id: @board_access.board_id, user_id: @board_access.user_id } }
    end

    assert_redirected_to board_access_url(BoardAccess.last)
  end

  test "should show board_access" do
    get board_access_url(@board_access)
    assert_response :success
  end

  test "should get edit" do
    get edit_board_access_url(@board_access)
    assert_response :success
  end

  test "should update board_access" do
    patch board_access_url(@board_access), params: { board_access: { board_id: @board_access.board_id, user_id: @board_access.user_id } }
    assert_redirected_to board_access_url(@board_access)
  end

  test "should destroy board_access" do
    assert_difference('BoardAccess.count', -1) do
      delete board_access_url(@board_access)
    end

    assert_redirected_to board_access_url
  end
end
