class Post < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments , as: :commentable, dependent: :destroy

  belongs_to :user 

  def name_user_comment(user_id)
    user= User.find(user_id)
    user.full_name
  end

    belongs_to :user  
end
