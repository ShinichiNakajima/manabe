require 'test_helper'

class RojikarusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rojikarus_index_url
    assert_response :success
  end

end
