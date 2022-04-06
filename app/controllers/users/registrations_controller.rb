# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params) 
    if resource.save  
      flash[:success]="Create user successful!!"
      redirect_to posts_path
    end
  end

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new" }
  end

  def edit
  end

  private
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :date_of_birth, :first_name, :last_name, :phone, :gender)
  end
end
