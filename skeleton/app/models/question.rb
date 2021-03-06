class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  has_many :voters, through: :votes, source: :user

  validates :user_id, :headline, :content, presence: true

  def points
    votes.sum(:value)
  end

end
