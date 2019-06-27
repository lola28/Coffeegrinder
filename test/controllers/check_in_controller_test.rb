require 'test_helper'

class CheckInControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get check_in_create_url
    assert_response :success
  end

  test "should get update" do
    get check_in_update_url
    assert_response :success
  end

  test "should get destroy" do
    get check_in_destroy_url
    assert_response :success
  end

end
