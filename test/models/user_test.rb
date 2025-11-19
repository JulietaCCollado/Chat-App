require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "Valid user" do
    user = User.new(email: "test@example.com", display_name: "TestUser", password: "password", password_confirmation: "password")
    assert user.valid?
  end

  test "invalid without email" do
    user = User.new(display_name: "TestUser", password: "password", password_confirmation: "password")
    refute user.valid?
  end
  
  test "invalid without display_name" do
    user = User.new(email: "test@example.com", password: "password", password_confirmation: "password")
    refute user.valid?
  end 
end
