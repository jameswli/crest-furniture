require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  def setup
    @customer = Customer.new({"name" => "Test", "organization" => "Test", "email" => "test@test.com", "telephone" => "6666666666", "cellphone" => "5555555555", "address_line_1" => "123 Test Ave", "address_line_2" => "123D", "city" => "Test", "state" => "CA", "zip_code" => "12345"})
    @customer.save
    @controller = CustomersController.new
    sign_in_user
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  # A customer needs all info to be created
  # Initial Customer should be invalid
  test "create invalid customer" do
    assert_no_difference 'Customer.count', 'A Customer should not be created' do
      post :create, :customer => {"name" => "no info"}
    end
  end

  # Create a valid customer with all info
  test "create customer" do
    assert_equal "Test", @customer.name
    assert_equal "Test", @customer.organization
    assert_equal "test@test.com", @customer.email
    assert_equal "6666666666", @customer.telephone
    assert_equal "5555555555", @customer.cellphone
    assert_equal "123 Test Ave", @customer.address_line_1
    assert_equal "123D", @customer.address_line_2
    assert_equal "Test", @customer.city
    assert_equal "CA", @customer.state
    assert_equal "12345", @customer.zip_code
    assert_not_nil @customer.id
  end

end
