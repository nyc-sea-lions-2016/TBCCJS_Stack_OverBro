class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true
	belongs_to :user
	has_many :votes, as: :voteable
	has_many :comments, as: :commentable


	validates :user_id, :content, :source_id, presence: true
	validates :commentable_type, presence: true
end
