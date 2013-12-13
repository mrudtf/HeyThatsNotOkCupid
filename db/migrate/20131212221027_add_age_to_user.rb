class AddAgeToUser < ActiveRecord::Migration
  def change
    remove_column :profiles, :age
    add_column :users, :age, :integer
  end
end
