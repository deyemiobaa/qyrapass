require "test_helper"

class Api::V1::AccessControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_access_create_url
    assert_response :success
  end
end
