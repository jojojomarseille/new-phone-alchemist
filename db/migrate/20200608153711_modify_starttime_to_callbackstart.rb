class ModifyStarttimeToCallbackstart < ActiveRecord::Migration[6.0]
  def change
    change_column :callbackstarts, :starttime, :datetime
  end
end
