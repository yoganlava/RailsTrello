require 'test_helper'

class BoardAccessControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board = boards(:one)
  end

  test "check if user has access" do
    sign_in()
    post '/api/board_access/has_access', params: {board_id: @board.id}, headers: {'Authorization': "Bearer #{@token}"}
    assert_equal "User has no access", JSON.parse(@response.body)["error"]
  end

  test "add access" do
    sign_in()
    post '/api/board_access/has_access', params: {email: "test@example.com", board_id: @board.id}, headers: {'Authorization': "Bearer #{@token}"}
    assert_response :success
  end

end
