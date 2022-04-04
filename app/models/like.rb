class Like < ApplicationRecord
    has_many :post
    has_many :user
    
    scope :count_likes, ->(id_post) {where(:post_id => id_post)}

    def self.count_like(id_post)
        count_likes(id_post).size
    end
end
