require 'test_helper'

class AnswerControllerTest < ActionController::TestCase
  test "should get ans" do
    get :ans
    assert_response :success
  end

end
