class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id, null: false
      t.integer :age
      t.string :gender
      t.string :orientation
      t.string :location
      t.string :summary
      t.string :job
      t.string :likes
      t.integer :min_age
      t.integer :max_age
      t.integer :max_distance

      t.timestamps
    end
  end
end
