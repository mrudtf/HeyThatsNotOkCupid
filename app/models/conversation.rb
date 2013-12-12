class Conversation < ActiveRecord::Base
  attr_accessible :low_user_id, :high_user_id

  validates :low_user_id, :high_user_id, presence: true
  validate :ids_are_correctly_ordered

  has_many :messages

  def self.find_by_unordered_ids(id1, id2)
    if id1 < id2
      low_id, high_id = id1, id2
    else
      low_id, high_id = id2, id1
    end

    self.find_by_low_user_id_and_high_user_id(low_id, high_id)
  end

  def self.find_or_create_by_ids(id1, id2)
    @conversation = self.find_by_unordered_ids(id1, id2)

    unless @conversation
      @conversation = self.new(low_user_id: low_id, high_user_id: high_id)
    end

    @conversation
  end

  private
  def ids_are_correctly_ordered
    if low_user_id > high_user_id
      errors.add(:low_user_id, "IDs passed in in wrong order")
    end
  end
end
