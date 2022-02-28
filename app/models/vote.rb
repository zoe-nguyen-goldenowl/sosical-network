class Vote < ApplicationRecord
    validates_uniqueness_of :users_id, scope: [:users_id, :posts_id]
end
