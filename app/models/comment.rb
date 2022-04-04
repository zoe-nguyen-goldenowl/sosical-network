class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :owner, polymorphic: true

  scope :count_comments, -> (post_id){where(:commentable_id => post_id)}

  def self.count_comment(post_id)
    count_comments(post_id).size
  end
end
