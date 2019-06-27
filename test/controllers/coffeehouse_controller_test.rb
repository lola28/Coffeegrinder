require 'test_helper'

class CoffeehouseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get coffeehouse_index_url
    assert_response :success
  end

  test "should get show" do
    get coffeehouse_show_url
    assert_response :success
  end

  test "should get edit" do
    get coffeehouse_edit_url
    assert_response :success
  end

  test "should get update" do
    get coffeehouse_update_url
    assert_response :success
  end

  test "should get new" do
    get coffeehouse_new_url
    assert_response :success
  end

  test "should get create" do
    get coffeehouse_create_url
    assert_response :success
  end

  test "should get destroy" do
    get coffeehouse_destroy_url
    assert_response :success
  end

end
