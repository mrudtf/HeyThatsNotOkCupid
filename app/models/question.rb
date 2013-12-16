class Question < ActiveRecord::Base
  attr_accessible :body, :answers

  validates :body, presence: true
  validate :proper_number_of_answers

  has_many :answers
  has_many :responses

  private
  def proper_number_of_answers
    #
  end
end
