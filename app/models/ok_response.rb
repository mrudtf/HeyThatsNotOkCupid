class OkResponse < ActiveRecord::Base
  attr_accessible :answer_id, :response_id

  validates :answer_id, :response_id, presence: true

  belongs_to :response
  belongs_to :answer
end
