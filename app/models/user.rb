class User < ApplicationRecord

  has_many :ratings, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :emails, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy

  attr_accessor :remember_token


  before_save {if self.email.present? then self.email = email.downcase end}

  #validates :user_name, presence: true, allow_nil: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, allow_nil: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
   validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Returns the hash digest of the given string.
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def User.new_token
      SecureRandom.urlsafe_base64
    end

    # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Sign in through Twitter.
  def self.find_or_create_from_auth_hash(auth)
    where(uid: auth.uid).first_or_initialize.tap do |user|
			user.uid = auth.uid
			user.user_name = auth.info.name
			# user.email = auth.info.email
      user.provider = auth.provider
      user.image = auth.info.image
      user.password = SecureRandom.urlsafe_base64
		end
	end


end
