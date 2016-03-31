class User < ActiveRecord::Base
  # Remember to create a migration!
  has_secure_password
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :username, uniqueness: true, presence: true
  validates :email, confirmation: true
  validates :email_confirmation, presence: true
end
