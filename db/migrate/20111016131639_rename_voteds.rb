class RenameVoteds < ActiveRecord::Migration
  def up
    rename_table :voteds, :usersevents
  end
  

  def down
    rename_table :voteds, :usersevents
  end
end
