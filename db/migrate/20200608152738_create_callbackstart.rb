class CreateCallbackstart < ActiveRecord::Migration[6.0]
  def change
    create_table :callbackstarts do |t|
      t.string :transid
      t.string :formule
      t.date :starttime
      t.string :numero
      t.string :code
      t.string :callernum
      t.timestamps
    end
  end
end
