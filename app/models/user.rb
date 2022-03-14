
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_many :friends
  has_many :likes
  has_many :comments , as: :owner
    
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, length: {is: 10}, allow_blank: true, format:{with: /\d/}
  validate :expiration_date 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private
  def expiration_date  
    errors.add(:date_of_birth, 'date of birth incorrect') if !self.date_of_birth.past? 
  end 

end
