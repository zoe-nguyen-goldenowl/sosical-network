class Like < ApplicationRecord
    has_many :post
    has_many :user
    
    scope :active, ->(id_post) {where(:post_id => id_post)}

    def count_like
        active.size
    end
end
