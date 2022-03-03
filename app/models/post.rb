class Post < ApplicationRecord
    has_one_attached :image

    has_many :like
    belongs_to :user
end
