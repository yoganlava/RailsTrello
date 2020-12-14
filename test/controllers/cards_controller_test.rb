require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # boards(:one)
    @card_table = card_tables(:one)
  end

  test "get card" do
    get "/api/card/get_cards?id=#{@card_table.id}"
    assert_equal "Example", JSON.parse(@response.body).first["name"]
  end

  test "no cards" do
    get "/api/card/get_cards?id=0"
    assert_equal [], JSON.parse(@response.body)
  end

  test "delete card" do
    get "/api/card/get_cards?id=#{@card_table.id}"
    post '/api/card/delete_cards', params: {_json: [JSON.parse(@response.body).first]}, xhr: true
    assert_response :success
  end

end
