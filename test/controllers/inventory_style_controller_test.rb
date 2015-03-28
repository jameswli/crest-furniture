require 'test_helper'

class InventoryStyleControllerTest < ActionController::TestCase
  def setup
    @controller = InventoryStylesController.new
    sign_in_user
    @user = users(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  # Styles needs all info to be created
  test "Invalid Style" do
    assert_no_difference 'InventoryStyle.count', 'A Style should not be created' do
      post :create, :inventory_style => {"name" => "no info"}
    end
  end    
 
  # Check Style is created along with ID
  test "Valid Style" do
    assert_difference 'InventoryStyle.count' do
      post :create, :inventory_style => {"name" => "Test", "manufacturer" => "Test", "model_number" => 1, "color" => "blue"}
    end
  end

end
