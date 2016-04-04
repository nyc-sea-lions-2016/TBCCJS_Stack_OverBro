class Comment < ActiveRecord::Base
	belongs_to :user
  belongs_to :commentable, polymorphic: true
	has_many :votes, as: :voteable

	validates :user_id, :content, presence: true
	validates :commentable_type, presence: true

  def points
    votes.sum(:value)
  end
end
