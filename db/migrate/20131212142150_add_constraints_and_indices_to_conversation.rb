class AddConstraintsAndIndicesToConversation < ActiveRecord::Migration
  def change
    add_index :conversations, :initiator_id
    add_index :conversations, :receiver_id
    add_index :conversations, [:initiator_id, :receiver_id], unique: true
  end
end
