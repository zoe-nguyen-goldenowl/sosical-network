# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
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

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end
  private
  def sign_up_params

    params.require(:user).permit(:email, :password, :password_confirmation, :date_of_birth, :first_name, :last_name, :phone, :gender)
  
  end
end
