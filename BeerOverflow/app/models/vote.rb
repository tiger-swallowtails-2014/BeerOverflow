class Vote < ActiveRecord::Base
  validates :user_id, presence: true
  belongs_to :voteable, polymorphic: true
  belongs_to :user
end
