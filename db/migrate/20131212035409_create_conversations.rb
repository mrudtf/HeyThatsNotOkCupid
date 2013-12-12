class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :initiator_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
