class Friend < ApplicationRecord
  has_many :user
  
  validates :friend_id, presence: true
  validates :user_id, presence: true
  
  enum status: {unfriend: 0, friend: 1}
   
  scope :active_friend, -> (user_id) {Friend.where(friend_id: user_id, status: :friend).or(Friend.where(user_id: user_id, status: :friend)) }
  scope :exist_friends, -> (friend_id, user_id){where(friend_id: friend_id, user_id: user_id).or(where(friend_id: user_id, user_id: friend_id))}

  def self.exist_friend(friend_id, user_id)
    if exist_friends(friend_id, user_id).any?
      true
    else
      false 
    end
  end 
 
end