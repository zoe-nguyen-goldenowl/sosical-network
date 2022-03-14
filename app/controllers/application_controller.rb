class ApplicationController < ActionController::Base
    before_action :set_users, :set_friends, :set_comments
    include Pagy::Backend
    def set_users
        @users= User.all
    end

    def set_friends
        @friends= Friend.all
    end

    def set_comments
        @users= User.all
    end

   
end
