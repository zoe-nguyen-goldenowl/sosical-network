class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :owner, polymorphic: true

  scope :count_comments, -> (post_id){where(commentable_id: post_id)}
end
