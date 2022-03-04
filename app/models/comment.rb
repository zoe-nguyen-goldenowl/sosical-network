class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :owner, polymorphic: true
  
  
end
