class CreateCallbackend < ActiveRecord::Migration[6.0]
  def change
    create_table :callbackends do |t|
      t.string :transid
      t.string :formule
      t.datetime :starttime
      t.string :numero
      t.datetime :endtime
      t.integer :duree
      t.timestamps
    end
  end
end
