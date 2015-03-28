require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @controller = UsersController.new
    sign_in_user
    @user = users(:one)
  end

  test "should not create user"do
    assert_no_difference 'User.count', 'Should not create user' do
      post :create, :user => {"name" => "Test"}
    end
  end

  # This Test is incomplete. Please update ASAP
  test "should create user" do
    assert_difference('User.count') do
      post :create, :user => {"name" => "Test", "email" => "test@test.com", "password" => "", "password_confirmation" => "", "role" => ""}
    end
   
    assert_redirected_to users_path
  end
end