class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def show
        @user=User.find_by(id: params[:id])
        @posts= Post.where(user_id: @user.id).order(created_at: :desc)

        @friend = Friend.where('user_id=? and self_user_id=?',"#{@user.id}","#{current_user.id}").or(Friend.where('user_id=? and self_user_id=?',"#{current_user.id}","#{@user.id}"))
    end

    def destroy
        
    end

end
  