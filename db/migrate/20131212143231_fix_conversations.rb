class FixConversations < ActiveRecord::Migration
  def change
    drop_table :conversations

    create_table :conversations do |t|
      t.integer :low_user_id
      t.integer :high_user_id

      t.timestamps
    end

    add_index :conversations, :low_user_id
    add_index :conversations, :high_user_id
    add_index :conversations, [:low_user_id, :high_user_id], unique: true
  end
end
