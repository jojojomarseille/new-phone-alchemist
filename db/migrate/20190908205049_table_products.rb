class TableProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products
    add_column :products, :title, :string
    add_column :products, :subtitle, :string
    add_column :products, :description, :string
    add_column :products, :price, :integer

  end
end
