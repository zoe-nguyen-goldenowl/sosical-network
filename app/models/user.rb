
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, length: {is: 10}, allow_blank: true, format:{with: /\d/}
  validates :date_of_birth, presence: true
  # validate :expiration_date
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  # private
  # def expiration_date
  #   debugger
  #   if self.date_of_birth.past? 
  #   else
  #     errors.add(:expiration_date, "can't be in the past")
  #   end
  # end  

end
