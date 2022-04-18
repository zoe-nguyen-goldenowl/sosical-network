class ApplicationController < ActionController::Base
  before_action :set_users, :new_post
  include Pagy::Backend
  include Pundit
  
  def set_users
    if user_signed_in?
      @users_suggest= User.user_except(current_user.id).limit(8).order("RANDOM()")

    else
      @users_suggest= User.limit(8).order("RANDOM()")
    end
  end

  def new_post
    @post= Post.new
  end

# <-- Alert of policy -->
  rescue_from Pundit::NotAuthorizedError,
	  with: :user_not_authorized
  private
  def user_not_authorized
    flash[:error] = "Function not in your role!"
    redirect_to(request.referrer)
  end

end
