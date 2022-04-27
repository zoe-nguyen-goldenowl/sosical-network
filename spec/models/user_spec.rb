require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe 'validations' do 
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }

    it { should validate_length_of(:phone).is_equal_to(10) }
    it { should allow_value("0123456789").for(:phone) }
  end

  describe 'activeRecord' do 
    it { should have_many(:friends) }
    it { should have_many(:posts) }
    it { should have_many(:likes) }
    it { should have_many(:comments) }
    it { should have_one_attached(:avatar) }
  end

  describe "enum" do
    it { should define_enum_for(:gender) }
  end
  
  describe "scope" do
    let(:user1){create(:user)}
    it "except user" do 
      expect(User.user_except(user1.id).size()).not_to eq(User.all.size())
    end
  end
  
  describe "public instance methods" do
    let(:user2){ create(:user) }
    it "full name user" do
      full_name= user2.first_name+" "+user2.last_name
      expect(user2.full_name).to eq(full_name) 
    end
  end
  
end
