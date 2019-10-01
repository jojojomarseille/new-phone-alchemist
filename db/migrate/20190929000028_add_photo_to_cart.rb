class AddPhotoToCart < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :photo_url, :string, default: "https://www.ikea.com/PIAimages/0710999_PE727908_S5.JPG?f=s"
  end
end
