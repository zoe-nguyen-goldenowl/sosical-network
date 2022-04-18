
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
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: {male: 1, female: 2}

  def full_name
    self.first_name+ " "+ self.last_name
  end

  def owner_of_(name_product)
    if self.id == name_product.user_id
      true
    else
      false
    end
  end

  private
  def expiration_date  
    errors.add(:date_of_birth, 'date of birth incorrect') if !self.date_of_birth.past? 
  end 

end
