class UserController < ApplicationController
    def show
        @users = User.all
    end
end
  