
class User < ApplicationRecord
  has_one_attached :avatar
  has_many :posts, dependent: :destroy

  has_many :friends, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments , as: :owner, dependent: :destroy
    
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, length: {is: 10}, allow_blank: true, format:{with: /\d/}
  validate :expiration_date 

  scope :user_except, -> (user){ where.not(id: user)}
  scope :set_friend, ->(friend_id) { where(id: friend_id)}
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: {male: 1, female: 2}

<<<<<<< HEAD
  
  def full_name
    self.first_name+ " "+ self.last_name
=======
  def self.set_friend(friend_id)  
    where(id: friend_id)
  end

  def self.full_name(user)
    user.first_name+ " "+ user.last_name
>>>>>>> 7bcb44cc77f2405d3f7dc11d11dc0facf1e5db12
  end


  private
  def expiration_date  
    errors.add(:date_of_birth, 'date of birth incorrect') if !self.date_of_birth.past? 
  end 

end
