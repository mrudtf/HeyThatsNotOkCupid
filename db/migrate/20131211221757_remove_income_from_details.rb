class RemoveIncomeFromDetails < ActiveRecord::Migration
  def change
    remove_column :details, :income
  end
end
