class RenameConversationIDs < ActiveRecord::Migration
  def change
    change_table :conversations do |t|
      t.rename :initiator_id, :low_user_id
      t.rename :receiver_id, :high_user_id
    end
  end
end
