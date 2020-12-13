require 'test_helper'

class BoardAccessControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board_access = board_access(:one)
  end

  test "should get index" do
    get board_access_url
    assert_response :success
  end

  test "should show board_access" do
    get board_access_url(@board_access)
    assert_response :success
  end
end
