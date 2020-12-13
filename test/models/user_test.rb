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
    assert user1.valid?

    user2 = User.new
    user2.email = "example@example.com"
    user2.password = "password"

    user2.save
    refute user2.valid?
  end

  test 'no email' do
    user = User.new
    user.password = "password"

    user.save
    refute user1.valid?
  end
end
