class Addcolumntousersevents < ActiveRecord::Migration
  def up
    add_column :usersevents, :admin, :integer
  end

  def down
    remove_column :usersevents, :admin, :integer
  end
end
