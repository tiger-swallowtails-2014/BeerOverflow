class Comment < ActiveRecord::Base
  has_many :votes, as: :voteable
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
