class Renamecols < ActiveRecord::Migration
  def up
    rename_column :voteds, :eventid, :event_id
    rename_column :voteds, :userid, :user_id
  end
  

  def down
    rename_column :voteds, :eventid, :event_id
    rename_column :voteds, :userid, :user_id
  end
end
