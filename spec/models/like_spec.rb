require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user1) {create(:user)}
  let(:post1) {create(:post, user_id: user1.id)}
  let(:user2) {create(:user)}
  let(:post2) {create(:post, user_id: user2.id)}
  let(:like) {create(:like, user_id: user1.id, post_id: post1.id)}

  describe "user like exist" do
    it "include like" do
      expect(Like.user_like_exist(post1.id, user1.id)).to include(like)
    end

    it "not include like" do
      expect(Like.user_like_exist(post2.id, user2.id)).not_to include(like)
    end
  end

  describe "validate" do
    it "has many users" do
      like = Like.reflect_on_association(:users)
      expect(like.macro).to eq(:has_many)
    end

    it "has many posts" do
      like = Like.reflect_on_association(:posts)
      expect(like.macro).to eq(:has_many)
    end

    it { should validate_uniqueness_of(:post_id).scoped_to(:user_id) }
  end
  
  
end
