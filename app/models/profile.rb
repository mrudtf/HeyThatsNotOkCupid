class Profile < ActiveRecord::Base
  attr_accessible :user_id, :age, :gender, :orientation, :location, :zip,
   :summary, :job, :likes, :min_age, :max_age, :max_distance

  validates :user_id, presence: true, uniqueness: true
  validates :zip, :gender, :age, :orientation, :min_age, :max_age,
   :max_distance, presence: true

   belongs_to :user
end