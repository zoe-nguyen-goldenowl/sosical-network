class ApplicationController < ActionController::Base
    before_action :set_users, :set_friends
    include Pagy::Backend
    
    def set_users
      @users_suggest= User.limit(8).order("RANDOM()")
    end

    def set_friends
      @friends= Friend.all
    end

end
