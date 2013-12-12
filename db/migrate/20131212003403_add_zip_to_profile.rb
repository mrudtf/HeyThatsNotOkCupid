class AddZipToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :zip, :integer, null: false
  end
end
