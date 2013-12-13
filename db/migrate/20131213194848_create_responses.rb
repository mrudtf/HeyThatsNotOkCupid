class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :question_id, null: false
      t.integer :answer_id, null: false
      t.integer :importance, null: false
      t.string :explanation

      t.timestamps
    end

    add_index :responses, [:user_id, :question_id], unique: true
  end
end
