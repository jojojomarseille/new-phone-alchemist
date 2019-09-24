require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get view" do
    get products_view_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
    post products_url, params: { product: {
      description: "sosomething",
      title: "mytitle",
      subtitle: "mysubtitle",
      price: 2,
      zone_id: 1,
      categorie_id: 1,
      photo: nil
    }
  }
  end
    assert_redirected_to products_url(Product.last)
  end

end
