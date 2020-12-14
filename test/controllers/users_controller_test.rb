require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest

  test "login" do
    user = User.create({
      email:"example@example.co.uk",
      password:"example",
    })
    post '/api/user_token', params:{auth:{email:user.email,password:user.password}}, xhr: true
    assert_response :success
  end

  test "register" do 
    post '/api/user', params: {user:{email:"example@example.co.uk",password:"example"}}, xhr: true
    message = JSON.parse(@response.body)
    assert_equal "User created", message["message"]
  end

end
