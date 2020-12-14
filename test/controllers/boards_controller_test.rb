require 'test_helper'

class BoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board = boards(:one)
  end

  test "test show" do
    get "/api/board/#{@board.id}"
    assert_equal @board.name, JSON.parse(@response.body)["name"]
  end

  test "save board" do
    sign_in()
    post '/api/board/save', params: {}, headers: {'Authorization': "Bearer #{@token}"}
    assert_response :success
  end

  test "create board" do
    sign_in()
    post '/api/board', params: {board:{name:""}}, headers: {'Authorization': "Bearer #{@token}"}
    assert_response :success
  end

  test "delete board" do
    sign_in()
    post '/api/board/delete_board', params: {}, headers: {'Authorization': "Bearer #{@token}"}
    assert_response :success
  end

end
