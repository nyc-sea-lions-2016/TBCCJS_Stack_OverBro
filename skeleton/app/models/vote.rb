class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :vote_type_id
  belongs_to :vote_type, polymorphic: true
  validates :user_id, presence: true
end
