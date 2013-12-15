class Question < ActiveRecord::Base
  attr_accessible :body, :answers

  validates :body, presence: true

  has_many :answers
  has_many :responses
end
