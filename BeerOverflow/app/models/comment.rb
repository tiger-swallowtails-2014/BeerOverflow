class Comment < ActiveRecord::Base
  validates :user_id, presence: true
  has_many :votes, as: :voteable
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
