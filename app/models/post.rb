class Post < ApplicationRecord
  has_one_attached :image
  has_many :likes
  has_many :comments , as: :commentable

  belongs_to :user 

  def self.count_like(post_id)
    Like.count_likes(post_id).size
  end

  def self.count_comment(post_id)
    Comment.count_comments(post_id).size
  end

end
