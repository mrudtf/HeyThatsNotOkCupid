class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :visitee_id, null: false
      t.integer :visitor_id, null: false

      t.timestamps
    end
  end
end