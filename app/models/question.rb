class Question < ActiveRecord::Base
  attr_accessible :body

  validates :body, presence: true

  has_many :answers
  has_many :responses
end
