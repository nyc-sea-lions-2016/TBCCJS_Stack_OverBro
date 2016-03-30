class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :vote_type
  validates :user_id, presence: true, polymorphic: true
end
