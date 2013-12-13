class CreateOkResponses < ActiveRecord::Migration
  def change
    create_table :ok_responses do |t|
      t.integer :response_id, null: false
      t.integer :answer_id, null: false

      t.timestamps
    end

    add_index :ok_responses, :response_id
  end
end
