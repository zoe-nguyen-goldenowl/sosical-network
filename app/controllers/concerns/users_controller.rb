class UsersController < ApplicationController
  before_action :set_user, only: %i[index update]
  def index
  end

  def update
    if @user.update(set_params)
      flash[:success]= "Edit profile successful!!"
      redirect_to users_path
      
    else
      flash[:error]= "Edit profile fail!!"
      redirect_to users_path
    end
  end
  
  private
  def set_user
    @user= User.find(current_user.id)    
  end

  def set_params
    params.require(:user).permit(:avatar, :first_name, :last_name, :phone, :gender)
  end

end
  