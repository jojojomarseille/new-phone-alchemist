class AddTransidToCodes < ActiveRecord::Migration[6.0]
  def change
    add_column :codes, :transid, :string
  end
end
