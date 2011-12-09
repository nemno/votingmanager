class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :value

      t.timestamps
    end
  end
end
