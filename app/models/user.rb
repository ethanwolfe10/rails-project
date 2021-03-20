class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
    has_many :subscriptions
    has_many :groups, through: :subscriptions
    has_many :followers
    has_many :posts, through: :groups
    has_many :likes
    has_many :comments
    has_many :posts
end
