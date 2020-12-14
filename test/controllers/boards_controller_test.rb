require 'test_helper'

class BoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board = boards(:one)
  end

  test "test show" do
    get "/api/board/#{@board.id}"
    assert_equal @board.name, JSON.parse(@response.body)["name"]
  end

  test "test save board" do
    
  end

  test "test create board" do
    
  end

  test "delete board" do
    sign_in()
    post '/api/board/delete_board', params: {}, headers: {'Authorization': "Bearer #{@token}"}
    assert_response :success
  end

end
