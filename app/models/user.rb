class User < ApplicationRecord
  before_save { self.email = self.email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: {case_sensitive: false}, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  validates :password,  presence: true, length: { within: 6..15 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
