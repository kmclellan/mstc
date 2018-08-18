class User < ApplicationRecord
  before_save { email.downcase! }
  validates  :firstname,   presence: true, length: { maximum: 25  }
  validates  :lastname,    presence: true, length: { maximum: 25  }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates  :email,      presence: true,  length: { maximum: 200 },
             format: { with: VALID_EMAIL_REGEX },
             uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
end

