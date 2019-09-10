class AddZoneToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :categorie_id, :integer
    add_index :products, :categorie_id
  end
end
