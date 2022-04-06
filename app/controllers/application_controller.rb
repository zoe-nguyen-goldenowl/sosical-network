class ApplicationController < ActionController::Base
  before_action :set_users
  include Pagy::Backend
  
  def set_users
    if user_signed_in?
      @users_suggest= User.user_except(current_user.id).limit(8).order("RANDOM()")

    else
      @users_suggest= User.limit(8).order("RANDOM()")
    end
  end
end
