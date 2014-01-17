class Question < ActiveRecord::Base
  attr_accessible :body, :answers

  validates :body, presence: true
  validate :proper_number_of_answers

  has_many :answers
  has_many :responses

  private
  def proper_number_of_answers
    # required because counting answers fires a db query and returns 0
    answer_bodies = answers.map { |answer| answer.body }
    if answer_bodies.count < 2 || answer_bodies.count > 4
      errors.add(:question, "needs between two and four answers")
    end
  end
end