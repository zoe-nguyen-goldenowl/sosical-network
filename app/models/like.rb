class Like < ApplicationRecord
has_many :post
has_many :user
# after_commit -> { LikeRelayJob.perform_later(self) }
end
