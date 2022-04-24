class Like < ApplicationRecord
  validates :post_id, uniqueness: {scope: :user_id}

  has_many :posts
  has_many :users

  scope :user_like_exist, ->(post_id, user_id) { where(post_id: post_id, user_id: user_id)}

end
