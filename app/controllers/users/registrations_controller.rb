# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController

  def create
    
    build_resource(sign_up_params)
    if  resource.save  
      
      self.resource = warden.authenticate!(auth_options)
      yield resource if block_given?
     
      redirect_to home_index_path
    else
      flash[:error]= "check your infomation!!"
      redirect_to new_user_session_path
    end
  end


  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new" }
  end

  # GET /resource/edit
  def edit
    
  end

  private
  def sign_up_params

    params.require(:user).permit(:email, :password, :password_confirmation, :date_of_birth, :first_name, :last_name, :phone, :gender)
  
  end
end
