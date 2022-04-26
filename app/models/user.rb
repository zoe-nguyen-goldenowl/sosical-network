
class User < ApplicationRecord
  has_one_attached :avatar
  has_many :posts, dependent: :destroy
  has_many :friends, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :comments , as: :owner, dependent: :destroy
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :gender, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  validates :phone, length: {is: 10}, allow_blank: true, format:{with: /\d/}
  validate :expiration_date 

  scope :user_except, -> (user){ where.not(id: user)}
  scope :search_full_name,-> (name){ where("CONCAT_WS(' ',first_name, last_name) iLIKE ?","%#{name}")}
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: {male: 1, female: 2}

  def full_name
    self.first_name+ " "+ self.last_name
  end

  private
  def expiration_date  
    errors.add(:date_of_birth, 'date of birth incorrect') if !self.date_of_birth.past? 
  end 

end
