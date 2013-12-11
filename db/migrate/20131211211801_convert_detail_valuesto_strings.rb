class ConvertDetailValuestoStrings < ActiveRecord::Migration
  def change
    drop_table :details

    create_table :details do |t|
      t.integer :user_id, null: false
      t.string :last_on
      t.string :height
      t.string :body_type
      t.string :diet
      t.string :smokes
      t.string :drinks
      t.string :drugs
      t.string :religion
      t.string :sign
      t.string :education
      t.string :job
      t.string :income
      t.string :offspring
      t.string :pets

      t.timestamps
    end
  end
end