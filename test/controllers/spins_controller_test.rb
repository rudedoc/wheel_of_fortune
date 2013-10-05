require 'test_helper'

class SpinsControllerTest < ActionController::TestCase
  setup do
    @spin = spins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spin" do
    assert_difference('Spin.count') do
      post :create, spin: { location_id: @spin.location_id, off_time: @spin.off_time, result: @spin.result, result_time: @spin.result_time, session_id: @spin.session_id, user_id: @spin.user_id }
    end

    assert_redirected_to spin_path(assigns(:spin))
  end

  test "should show spin" do
    get :show, id: @spin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spin
    assert_response :success
  end

  test "should update spin" do
    patch :update, id: @spin, spin: { location_id: @spin.location_id, off_time: @spin.off_time, result: @spin.result, result_time: @spin.result_time, session_id: @spin.session_id, user_id: @spin.user_id }
    assert_redirected_to spin_path(assigns(:spin))
  end

  test "should destroy spin" do
    assert_difference('Spin.count', -1) do
      delete :destroy, id: @spin
    end

    assert_redirected_to spins_path
  end
end
