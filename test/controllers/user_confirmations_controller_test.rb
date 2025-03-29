require "test_helper"

class UserConfirmationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_confirmations_index_url
    assert_response :success
  end
end
