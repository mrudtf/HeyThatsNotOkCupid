class User < ActiveRecord::Base
  attr_accessible :name, :password
  attr_reader :password

  validates :password_digest, :presence => { :message => "Password can't be blank" }
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  validates :token, :presence => true
  validates :name, :presence => true

  after_initialize :ensure_session_token

  has_one :profile
  has_one :detail
  has_many :photos

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