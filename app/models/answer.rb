class Answer < ActiveRecord::Base
  attr_accessible :body, :question_id

  validates :body, presence: true

  belongs_to :question
  has_many :responses
  has_many :ok_responses
end
