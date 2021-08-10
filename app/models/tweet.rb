class Tweet < ApplicationRecord
  validates :tweet, presence: true, length: { maximum: 140 }
  belongs_to :user
  has_many :comments
  has_many :tweet_likes
end
