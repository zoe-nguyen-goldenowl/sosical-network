class Friend < ApplicationRecord
   has_many :user

   def self.exist_friend(friend_id, user_id)
     if Friend.where(friend_id: friend_id, user_id: user_id).or(Friend.where(friend_id: user_id, user_id: friend_id)).any?
      true
     else
      false
     end
   end 

   def self.active_friend(user_id)
      friends= Friend.where(friend_id: user_id).or(Friend.where(user_id: user_id))
      return friends.where(status: 1)
   end
end