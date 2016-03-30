class User < ActiveRecord::Base
  # Remember to create a migration!
  has_secure_password
  has_many :questions
  has_many :comments
  has_many :votes

  validates :email, :username, uniqueness: true, presence: true
  validates :password_digest, presence: true
end
