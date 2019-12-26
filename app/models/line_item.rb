class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  monetize :price_cents

  def total
    product.price_cents * quantity
  end

end
