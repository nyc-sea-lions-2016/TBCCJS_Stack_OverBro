class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes
  has_many :comments, as: :comment_type

  validates :user_id, :headline, :content, presence: true,
end
