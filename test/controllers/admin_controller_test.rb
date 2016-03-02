require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get user_list" do
    get :user_list
    assert_response :success
  end

end
