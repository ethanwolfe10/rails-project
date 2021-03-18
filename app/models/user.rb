class User < ApplicationRecord
    has_many :subscriptions
    has_many :groups, through: :subscriptions
    has_many :followers
    has_many :followings
    has_many :posts, through: :groups
    has_many :likes
    has_many :comments
end
