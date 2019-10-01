class AddSkuToCart < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :sku, :string
  end
end
