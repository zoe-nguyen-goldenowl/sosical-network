class ApplicationController < ActionController::Base
  before_action :set_users
  include Pagy::Backend
  
  def set_users
    @users_suggest= User.limit(8).order("RANDOM()")
  end
end
