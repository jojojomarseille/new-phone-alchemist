require 'test_helper'

class ZonesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get zones_url
    assert_response :success
  end

  test "should get new" do
    get zones_new_url
    assert_response :success
  end

  test "should get create" do
    get zones_create_url
    assert_response :success
  end

  test "should get show" do
    get zones_show_url
    assert_response :success
  end

  test "should get update" do
    get zones_update_url
    assert_response :success
  end

  test "should get delete" do
    get zones_delete_url
    assert_response :success
  end

end
