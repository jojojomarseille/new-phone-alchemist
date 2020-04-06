class LineItem < ApplicationRecord

  belongs_to :product


  def total
    product.price* quantity
  end

end
