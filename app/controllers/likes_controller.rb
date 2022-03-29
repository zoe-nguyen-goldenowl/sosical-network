class LikesController < ApplicationController
  before_action :require_login, only: :create, :destroy

  def create
    if Like.exists?(user_id: params[:user_id], post_id: params[:post_id])
     destroy
    else
      @like= Like.new(user_id: params[:user_id], post_id: params[:post_id])
        if @like.save
          redirect_to posts_path
          ActionCable.server.broadcast "like", {count_like: (Like.active params[:post_id]).size, post_id: params[:post_id] }
        else
          flash[:error]= "like fail!"
          redirect_to posts_path
        end
    end
  end

  def destroy
    set_like
    if @like.destroy
      ActionCable.server.broadcast "like", { count_like: (Like.active params[:post_id]).size, post_id: params[:post_id] }
      respond_to do |format|
          format.html { redirect_to posts_path}
      end
    else
      respond_to do |format|
        flash[:error] = "like was fail destroy" 
        format.html { redirect_to posts_path}
      end
    end
  end

  private
    def set_like
      @like = Like.find_by(user_id: params[:user_id], post_id: params[:post_id])
    end

    def require_login
      if !user_signed_in?
        redirect_to new_user_session_path
      end
    end
end
