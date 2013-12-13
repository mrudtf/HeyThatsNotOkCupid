class Response < ActiveRecord::Base
  attr_accessible :answer_id, :explanation, :importance, :question_id, :user_id

  validates :answer_id, :importance, :question_id, :user_id, presence: true

  belongs_to :user
  belongs_to :question
  belongs_to :answer

  has_many :ok_responses
end
