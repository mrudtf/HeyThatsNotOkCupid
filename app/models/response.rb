class Response < ActiveRecord::Base
  attr_accessible :answer_id, :explanation, :importance, :question_id, :user_id,
    :ok_answer_ids

  validates :answer, :importance, :question, :user, presence: true

  belongs_to :user
  belongs_to :question
  belongs_to :answer

  has_many :ok_responses, dependent: :destroy

  has_many(
    :ok_answers,
    through: :ok_responses,
    source: :answer
  )
end
