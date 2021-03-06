class User < ActiveRecord::Base
  attr_accessible :name, :password, :gender, :orientation, :age, :photo,
   :latitude, :longitude, :address
  attr_reader :password

  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :token, :name, :gender, :orientation, :photo, presence: true
  validates :age, inclusion: { in: 18..125, message: "is
     unacceptable" }
  validates :gender, inclusion: { in: ["M", "F"] }
  validates :orientation, inclusion: { in: ["Straight", "Gay", "Bisexual"] }
  validates :name, uniqueness: true

  after_initialize :ensure_token

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  has_attached_file :photo, styles: {
    big: "160x160#",
    small: "40x40#"
  }

  has_one :profile, dependent: :destroy
  has_one :detail, dependent: :destroy
  has_one :photo, dependent: :destroy
  has_many :responses, dependent: :destroy

  has_many(
    :inbound_visits,
    class_name: "Visit",
    foreign_key: :visitee_id,
    primary_key: :id
  )

  has_many(
    :outbound_visits,
    class_name: "Visit",
    foreign_key: :visitor_id,
    primary_key: :id
  )

  has_many(
    :answered_questions,
    through: :responses,
    source: :question
  )

  has_many(
    :ok_responses,
    through: :responses,
    source: :ok_responses
  )

  has_many(
    :ok_answers,
    through: :responses,
    source: :ok_answers
  )

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