
class User < ApplicationRecord
  has_one_attached :avatar
  has_many :posts
  has_many :friends
  has_many :likes
  has_many :comments , as: :owner
    
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, length: {is: 10}, allow_blank: true, format:{with: /\d/}
  validate :expiration_date 

  scope :user_except, -> (user){ where.not(id: user)}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: {male: 1, female: 2}

  def full_name
    first_name+ " "+last_name
  end

  private
  def expiration_date  
    errors.add(:date_of_birth, 'date of birth incorrect') if !self.date_of_birth.past? 
  end 

end
