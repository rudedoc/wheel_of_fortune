require 'test_helper'

class PlayControllerTest < ActionController::TestCase
  test "should get game" do
    get :game
    assert_response :success
  end

end
