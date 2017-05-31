require 'test_helper'

class ResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get results_index_url
    assert_response :success
  end

  test "should get add" do
    get results_add_url
    assert_response :success
  end

end
