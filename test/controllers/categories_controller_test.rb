require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "shouldnt get index" do
    get categories_path
    assert_response :error
  end

  test "should get new" do
    get new_category_path
    assert_response :success
  end

  test "should get show" do
    get category_path[1]
    assert_response :success
  end

end
