class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true
	belongs_to :user
	has_many :votes
	has_many :comments, as: :commentable


	validates :user_id, :content, :source_id, :best_answer?, presence: true
	validates :commentable_type, presence: true
end
