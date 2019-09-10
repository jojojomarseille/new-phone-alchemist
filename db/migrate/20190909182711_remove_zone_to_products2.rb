class RemoveZoneToProducts2 < ActiveRecord::Migration[6.0]
  def change
     remove_column :products, :zone, :string
  end
end
