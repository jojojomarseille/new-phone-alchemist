class CreateCalls < ActiveRecord::Migration[6.0]
  def change
    create_table :calls do |t|
      t.string :transid
      t.string :formule
      t.date :starttime
      t.string :numero
      t.string :code
      t.string :callernum
      t.datetime :endtime
      t.integer :duree
      t.string :call_status
      t.string :code_status
      t.timestamps
    end
  end
end
