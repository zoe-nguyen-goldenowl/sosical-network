class FriendsController < ApplicationController
  before_action :require_login, only: %i[ create destroy update]
  before_action :set_friend, only: %i[ update destroy ]

  def index
    @friends= Friend.active_friend(current_user.id)
  end

  def new
    @users= User.user_except(current_user)
  end

  def edit
   @friends = Friend.where(friend_id: current_user.id, status: :unfriend)
  end

  def show
    @user= User.find(params[:id])
  end

  def create
    if Friend.exist_friend(current_user.id, params[:format])   
      flash[:error] = "You have sent this person a friend request before!!"
      redirect_to  friends_path 

    else   
      @friend = Friend.new(status: 0, friend_id: params[:format], user_id: current_user.id)

      if @friend.save
        flash[:success] = "Friend request has been sent successfully.!!"
        redirect_to  friends_path
      else
        flash[:error] = "Friend request has been sent unsuccessfully!!"
        redirect_to friends_path, status: :unprocessable_entity 
      end
    end
  end

  def update
    if @friend.update(status: 1)
      flash[:success]= "successfully added friend!!"
      render :edit
    else
      flash[:error]= "Fail added friend!!"
      render :edit
    end
  end

  def destroy
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to friends_path, notice: "Friend was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_friend
      @friend = Friend.find_by(user_id: params[:id])
    end

    def require_login
      if !user_signed_in?
        flash[:error]= "Log in to add friends, like posts, and view comments!"
        redirect_to new_user_session_path
      end
    end
end
