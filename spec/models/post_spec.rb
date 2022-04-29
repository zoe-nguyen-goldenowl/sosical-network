require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "active record " do
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_one_attached(:image) }
    it { should belong_to(:user)}
  end
  
  describe "information user comments posts" do
    let(:user) {build(:user)}
    let(:post) {build(:post, user_id: user.id)}

    # it "name user ownwer comments" do
    #   name_user= Post.name_user_comment(user.id)
    #   expect(Post.name_user_comment(user.id)).to  eq(user.full_name)
    # end
  end
  
end
