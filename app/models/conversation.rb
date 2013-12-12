class Conversation < ActiveRecord::Base
  attr_accessible :initiator_id, :receiver_id

  validates :initiator_id, :receiver_id, presence: true

  has_many :messages
end
