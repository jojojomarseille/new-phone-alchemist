class RemoveBookingSkuFromOrder < ActiveRecord::Migration[6.0]
  def change

    remove_column :orders, :booking_sku, :string
  end
end
