class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :user_id, null: false
      t.string :last_on
      t.integer :height
      t.integer :body_type
      t.integer :diet
      t.integer :smokes
      t.integer :drinks
      t.integer :drugs
      t.integer :religion
      t.integer :sign
      t.integer :education
      t.integer :job
      t.integer :income
      t.integer :offspring
      t.integer :pets

      t.timestamps
    end
  end
end
