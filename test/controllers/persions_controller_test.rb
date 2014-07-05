require 'test_helper'

class PersionsControllerTest < ActionController::TestCase
  setup do
    @persion = persions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:persions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create persion" do
    assert_difference('Persion.count') do
      post :create, persion: { bio: @persion.bio, birthday: @persion.birthday, name: @persion.name }
    end

    assert_redirected_to persion_path(assigns(:persion))
  end

  test "should show persion" do
    get :show, id: @persion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @persion
    assert_response :success
  end

  test "should update persion" do
    patch :update, id: @persion, persion: { bio: @persion.bio, birthday: @persion.birthday, name: @persion.name }
    assert_redirected_to persion_path(assigns(:persion))
  end

  test "should destroy persion" do
    assert_difference('Persion.count', -1) do
      delete :destroy, id: @persion
    end

    assert_redirected_to persions_path
  end
end
