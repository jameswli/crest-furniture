require 'test_helper'

class InventoryItemsControllerTest < ActionController::TestCase
  def setup
    @style = InventoryStyle.new({"name" => "Test", "manufacturer" => "Test", "model_number" => 1, "color" => "blue"})
    @style.save
    @item = InventoryItem.new({"serial_number" => "123456789"})
    @item.save
    @item2 = InventoryItem.new({"serial_number" => "12345678", "status" => "Good", "condition" => "Good", "inventory_style_id" => @style.id})
    @item2.save
  end

  # Can't authenticate so fails
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  # Inventory Item needs all info to be created
  # Initial Item should be invalid
  test "create invalid Item" do
    assert_empty @item
  end

  # Create a valid item with all info
  test "create item" do
    assert_equal "12345678", @item2.serial_number
    assert_equal "Good", @item2.status
    assert_equal "Good", @item2.condition
    assert_not_nil @item2.inventory_style_id
    assert_equal @style.id, @item2.inventory_style_id
  end

end
