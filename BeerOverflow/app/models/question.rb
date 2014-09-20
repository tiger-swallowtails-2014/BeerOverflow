class Question < ActiveRecord::Base
  has_many :votes, as: :voteable
  has_many :answers
  has_many :comments, as: :commentable
  belongs_to :user 
end
