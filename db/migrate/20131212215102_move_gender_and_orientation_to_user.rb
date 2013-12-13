class MoveGenderAndOrientationToUser < ActiveRecord::Migration
  def change
    remove_column(:profiles, :gender, :orientation)
    add_column(:users, :gender, :string)
    add_column(:users, :orientation, :string)

    change_column(:profiles, :summary, :text)
    change_column(:profiles, :job, :text)
    change_column(:profiles, :likes, :text)
  end
end