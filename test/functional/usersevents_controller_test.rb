require 'test_helper'

class UserseventsControllerTest < ActionController::TestCase
  setup do
    @usersevent = usersevents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usersevents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usersevent" do
    assert_difference('Usersevent.count') do
      post :create, :usersevent => @usersevent.attributes
    end

    assert_redirected_to usersevent_path(assigns(:usersevent))
  end

  test "should show usersevent" do
    get :show, :id => @usersevent.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @usersevent.to_param
    assert_response :success
  end

  test "should update usersevent" do
    put :update, :id => @usersevent.to_param, :usersevent => @usersevent.attributes
    assert_redirected_to usersevent_path(assigns(:usersevent))
  end

  test "should destroy usersevent" do
    assert_difference('Usersevent.count', -1) do
      delete :destroy, :id => @usersevent.to_param
    end

    assert_redirected_to usersevents_path
  end
end
