class Answer < ActiveRecord::Base
  validates :user_id, presence: true
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  belongs_to :user
  belongs_to :question
  validates :question, presence: true
end
