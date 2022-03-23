class Friend < ApplicationRecord
#  sua lai
   def self.active_friend(id)
      Friend.where("(user_id= #{id} or self_user_id= #{id}) and status= 1")
   end
end