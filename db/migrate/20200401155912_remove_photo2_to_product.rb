class RemovePhoto2ToProduct < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :photo2
  end
end
