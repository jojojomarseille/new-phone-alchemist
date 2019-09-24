require 'test_helper'

class ProductTest < ActiveSupport::TestCase


 test "product attributes must not be empty" do
   product = Product.new
   assert product.invalid?
 end

 test "product price must be greater than or equal to 1" do
  product = Product.new(
    title: "some product",
    subtitle: "some subtitle",
    description: "some description",
    price: 0

    )
  assert product.invalid?
  assert_equal ["must be greater than or equal to 1"], product.errors[:price]

  product.price = 2
  assert product.valid?
#la deuxiéme partie du test ne fonctionne pas, je ne sait pas pk :-/
 end
end
