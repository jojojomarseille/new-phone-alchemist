class AddPriceToCart < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :price, :integer, default: 10
  end
end
