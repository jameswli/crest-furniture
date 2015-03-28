require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @controller = ProjectsController.new
    sign_in_user
    @user = users(:one)
    @project = projects(:one)
    @project.save
    @customer = customers(:one)
    @customer.save
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: {"name" => "Test", "type" => "Rental", "stage" => "Pre-Design", "customer" => @customer, "sale_delivery" => "1/1/2011", "rental_delivery" => "1/2/2011", "rental_pickup" => "1/2/2012"}
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    patch :update, id: @project.id, project: {"name" => "Derp"}
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
