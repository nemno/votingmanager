class CreateVoteds < ActiveRecord::Migration
  def change
    create_table :voteds do |t|
      t.integer :eventid
      t.integer :userid

      t.timestamps
    end
  end
end
