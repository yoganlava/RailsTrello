ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

module SignInHelper
  def sign_in()
    @user = User.create({
      email:"udeshya@hotmail.co.uk",
      password:"gurung",
    })
    post '/api/user_token', params:{auth: {email:@user.email,password:@user.password}}, xhr: true
    @token = JSON.parse(@response.body)['jwt']
  end
end
class ActionDispatch::IntegrationTest
  include SignInHelper
end