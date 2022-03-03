class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_users, :set_friends
  
    def set_users
        @users= User.all
    end

    def set_friends
        @friends= Friend.all
    end
end
