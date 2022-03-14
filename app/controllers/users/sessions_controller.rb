# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
 
  # GET /resource/sign_in
  # def new
  #   self.resource = resource_class.new(configure_sign_in_params)
  # end

  # POST /resource/sign_in
  # def create
    
  #   binding.pry

    
  # end

  # DELETE /resource/sign_out
  #  def destroy

  #  end

  #  protected
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.sanitize(:sign_in)
  # end
  # def after_sign_out_path_for(resource_or_scope)
  #   redirect_to new_user_session_path
  # end
end

