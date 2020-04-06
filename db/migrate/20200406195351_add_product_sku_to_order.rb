class AddProductSkuToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :product_sku, :string
  end
end
