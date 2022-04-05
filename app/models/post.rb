class Post < ApplicationRecord
  has_one_attached :image
  has_many :likes
  has_many :comments , as: :commentable

  belongs_to :user 

  def count_like(post_id)
    Like.count_likes(post_id).size
  end

  def count_comment(post_id)
    Comment.count_comments(post_id).size
  end

  def user_full_name(user_id)
    user= User.find(user_id)
    user.full_name
  end

end
