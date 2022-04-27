require 'rails_helper'

RSpec.describe Friend, type: :model do
  let(:user1) {create(:user)}
  let(:user2) {create(:user)}  
  let(:friend1) {create(:friend, user_id: user1.id, friend_id: user2.id, status: "friend")} 
  let(:friend2) {create(:friend, user_id: user1.id, friend_id: user2.id)} 


  describe "validate" do
    it "has many friends" do
      friend= Friend.reflect_on_association(:users)
      expect(friend.macro).to eq(:has_many)
    end  
  end

  describe "Validate" do
    it { should validate_presence_of(:friend_id) }
    it { should validate_presence_of(:user_id) } 
  end

  describe "enum status" do
    it { should define_enum_for(:status) }
  end 

  describe "scope" do
    it "active friend" do
      expect(Friend.active_friend(user1.id)).to include(friend1)  
    end

    it "exist friends" do
      expect(Friend.exist_friends(user1.id, user2.id)).to include(friend2)
    end
  end
  
end
