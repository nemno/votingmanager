class CreateUsersevents < ActiveRecord::Migration
  def change
    create_table :usersevents do |t|
      t.string :event_id
      t.string :user_id
      t.string :admin

      t.timestamps
    end
  end
end
