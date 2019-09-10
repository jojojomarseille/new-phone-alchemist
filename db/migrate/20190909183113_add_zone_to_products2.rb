class AddZoneToProducts2 < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :zone_id, :integer
    add_index :products, :zone_id
  end
end
