class CreateCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :codes do |t|
      t.belongs_to :user, null: false
      t.string :code, limit:10
      t.float :value
      t.string :finaluser
      t.string :associatedorder
      t.string :status
      t.datetime :valid_until
      t.datetime :utilised_at
      t.timestamps
    end
  end
end
