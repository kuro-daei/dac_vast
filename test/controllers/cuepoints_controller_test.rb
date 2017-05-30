require 'test_helper'

class CuepointsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cuepoints_index_url
    assert_response :success
  end

end
