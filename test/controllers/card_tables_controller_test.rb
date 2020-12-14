require 'test_helper'

class CardTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    # boards(:one)
    @board = boards(:one)
  end

  test "get card table" do
    get "/api/card_table/get_card_tables?id=#{@board.id}"
    assert_equal "Example", JSON.parse(@response.body).first["name"]
  end

  test "no card table" do
    get "/api/card_table/get_card_tables?id=0"
    assert_equal [], JSON.parse(@response.body)
  end

  test "delete card table" do
    get "/api/card_table/get_card_tables?id=#{@board.id}"
    post '/api/card_table/delete_tables', params: {_json: [JSON.parse(@response.body).first]}, xhr: true
    assert_response :success
  end
end
