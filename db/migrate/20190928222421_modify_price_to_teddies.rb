class ModifyPriceToTeddies < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :price, :integer, currency: { present: false }
  end
end
