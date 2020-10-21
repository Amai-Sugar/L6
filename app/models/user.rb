class User < ApplicationRecord
    validates :uid, presence: true, uniqueness: true
    has_many :like_tweets, through: :likes, source: :tweet
end
