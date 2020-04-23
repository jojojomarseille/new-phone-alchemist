class AddCpToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cp, :string
  end
end
