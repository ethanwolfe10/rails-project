class Post < ApplicationRecord
    belongs_to :group
    belongs_to :user
    has_many :comments
    has_many :likes
end
