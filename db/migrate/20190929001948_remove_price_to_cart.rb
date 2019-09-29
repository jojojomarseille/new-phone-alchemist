class RemovePriceToCart < ActiveRecord::Migration[6.0]
  def change
    remove_column :carts, :price
  end
end
