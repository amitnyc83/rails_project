require 'test_helper'

class PhysiciansControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get physicians_new_url
    assert_response :success
  end

end
