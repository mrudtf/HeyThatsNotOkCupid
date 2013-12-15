class Message < ActiveRecord::Base
  attr_accessible :conversation_id, :body, :sender_id, :receiver_id

  validates :sender, :receiver, presence: true

  belongs_to :conversation

  belongs_to(
    :sender,
    class_name: "User",
    foreign_key: :sender_id,
    primary_key: :id
  )

  belongs_to(
    :receiver,
    class_name: "User",
    foreign_key: :receiver_id,
    primary_key: :id
  )

end
