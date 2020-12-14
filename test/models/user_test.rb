require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new
    user.email = "example@example.com"
    user.password = "password"

    user.save
    assert user.valid?
  end

  test 'duplicate email' do
    user1 = User.new
    user1.email = "example@example.com"
    user1.password = "password"

    user1.save

    user2 = User.new
    user2.email = "example@example.com"
    user2.password = "password"

    assert_raise do
      user2.save
    end
  end

  test 'no email' do
    user = User.new
    user.password = "password"

    assert_raise do
      user.save
    end
  end
end
