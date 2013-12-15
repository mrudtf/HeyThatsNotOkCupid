class OkResponse < ActiveRecord::Base
  attr_accessible :answer_id, :response_id

  validates :answer, :response, presence: true

  belongs_to :response
  belongs_to :answer
end
