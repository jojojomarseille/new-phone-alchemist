class RemoveCartIdFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :cart_id
  end
end
