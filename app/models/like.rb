class Like < ApplicationRecord
  has_many :post
  has_many :user

  scope :count_likes, ->(id_post) {where(post_id: id_post)}
end
