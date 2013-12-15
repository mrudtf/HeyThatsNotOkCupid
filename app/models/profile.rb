class Profile < ActiveRecord::Base
  attr_accessible :user_id, :location, :zip,
   :summary, :job, :likes, :min_age, :max_age, :max_distance

  validate :min_age_is_less_than_max_age

  validates :user, presence: true, uniqueness: true
  validates :zip, :min_age, :max_age, :max_distance, presence: true
  validates :zip, length: { is: 5 }, numericality: true
  validates :min_age, :max_age, inclusion: { in: 18..125, message: "is
     unacceptable" }
  validates :max_distance, inclusion: { in: 0..12455, message: "is too big for
     even love to conquer" }


  belongs_to :user

  private
  def min_age_is_less_than_max_age
    errors[:ages] << "- Minimum age must be less than maximum age" unless
     min_age <= max_age
  end
end