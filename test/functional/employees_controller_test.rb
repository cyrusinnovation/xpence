require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  setup do
    @user = Employee.new(:name => 'John')
    @user.stubs(:id).returns(1)
    @user.stubs(:admin?).returns(true)
    @controller.stubs(:current_user).returns(@user)
  end

  test "GET index" do 
    get :index

    assert_response :success
    assert_not_nil(assigns(:employees))
    assert_template(:index)
  end

  test "GET show" do
    Employee.stubs(:find).with(@user.id.to_s).returns(@user)
    get :show, :id => @user.id

    assert_response :success
    assert_not_nil(assigns(:employee))
    assert_template(:show)
  end

  test "GET new" do
    get :new

    assert_response :success
    assert_not_nil(assigns(:employee))
    assert_template(:new)
  end

  test "GET edit" do
    Employee.stubs(:find).with(@user.id.to_s).returns(@user)

    get :edit, :id => @user.id

    assert_response :success
    assert_not_nil(assigns(:employee))
    assert_template(:edit)
  end

  test "successful POST create" do
    Employee.any_instance.expects(:save).returns(true)

    post :create, :employee => {}

    assert_response :redirect
    assert_equal('Employee was successfully created.', flash[:notice])
  end

  test "unsuccessful POST create" do
    Employee.any_instance.expects(:save).returns(false)

    post :create, :employee => {}

    assert_response :success
    assert_template(:new)
    assert_not_nil(assigns(:employee))
  end

  test "successful PUT update" do
    Employee.stubs(:find).with(@user.id.to_s).returns(@user)
    Employee.any_instance.expects(:update_attributes).returns(true)

    put :update, :id => @user.id, :employee => {}

    assert_response :redirect
    assert_equal('Employee was successfully updated.', flash[:notice])
  end

  test "unsuccessful PUT update" do
    Employee.stubs(:find).with(@user.id.to_s).returns(@user)
    Employee.any_instance.expects(:update_attributes).returns(false)

    put :update, :id => @user.id, :employee => {}

    assert_response :success
    assert_template(:edit)
    assert_not_nil(assigns(:employee))
  end

  test "DELETE destroy" do
    @user.expects(:destroy)
    Employee.stubs(:find).with(@user.id.to_s).returns(@user)

    delete :destroy, :id => @user.id

    assert_response :redirect
  end
end
