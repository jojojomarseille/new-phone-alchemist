class AddPhoto2ToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :photo2, :string, default:"https://www.mega-pc.net/wp-content/uploads/2019/08/image_cover-1.jpg"
  end
end
