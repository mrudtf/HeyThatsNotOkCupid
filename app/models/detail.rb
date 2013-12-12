class Detail < ActiveRecord::Base
  attr_accessible :user_id, :last_on, :height, :body_type, :diet, :smokes,
   :drinks, :drugs, :religion, :sign, :education, :job, :offspring, :pets

  before_validation :set_last_login

  validates :user_id, presence: true, uniqueness: true
  validates :last_on, presence: true

  belongs_to :user

  private
  def set_last_login
    self.last_on ||= Time.now
  end
end