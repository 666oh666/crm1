require 'test_helper'

class HomesControllerTest < ActionController::TestCase
  test "should get top" do
    get :top
    assert_response :success
  end

end
