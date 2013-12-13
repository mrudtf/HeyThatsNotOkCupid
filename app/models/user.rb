class User < ActiveRecord::Base
  attr_accessible :name, :password, :gender, :orientation, :age
  attr_reader :password

  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :token, presence: true
  validates :name, :gender, :orientation, presence: true
  validates :age, inclusion: { in: 18..125, message: "is
     unacceptable" }
  validates :gender, inclusion: { in: ["M", "F"] }
  validates :orientation, inclusion: { in: ["Straight", "Gay", "Bisexual"] }

  after_initialize :ensure_token

  has_one :profile
  has_one :detail
  has_many :photos

  has_many(
    :conversations_as_lower_user_id,
    class_name: "Conversation",
    foreign_key: :low_user_id,
    primary_key: :id
  )

  has_many(
    :conversations_as_higher_user_id,
    class_name: "Conversation",
    foreign_key: :high_user_id,
    primary_key: :id
  )

  has_many(
    :sent_messages,
    class_name: "Message",
    foreign_key: :sender_id,
    primary_key: :id
  )

  has_many(
    :received_messages,
    class_name: "Message",
    foreign_key: :receiver_id,
    primary_key: :id
  )

  def conversations
    self.conversations_as_lower_user_id + self.conversations_as_higher_user_id
  end

  def self.find_by_credentials(name, password)
    user = User.find_by_name(name)

    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end

  def self.generate_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_token!
    self.token = self.class.generate_token
    self.save!
  end

  private
  def ensure_token
    self.token ||= self.class.generate_token
  end
end