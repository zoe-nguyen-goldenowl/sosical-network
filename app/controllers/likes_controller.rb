class LikesController < ApplicationController
  before_action :require_login, only: %i[create destroy]
  before_action :set_like, only: :destroy

  before_action :set_post, only: %i[create destroy]

  def create
    @like= Like.new(user_id: current_user.id, post_id: params[:post_id])

    if @like.save  
      ActionCable.server.broadcast "like", {count_like: @post.count_like(params[:post_id]), post_id: params[:post_id] }
      redirect_to posts_path

    else
      flash[:error]= "like fail!"
      redirect_to posts_path
    end
    
  end

  def destroy
    if @like.destroy
      ActionCable.server.broadcast "like", { count_like: @post.count_like(params[:post_id]), post_id: params[:post_id] }     
      redirect_to posts_path
      
    else
      flash[:error] = "like was fail destroy" 
      redirect_to posts_path
    end
  end

  private
  def set_like   
    @like = Like.find_by(post_id: params[:post_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def require_login
    if !user_signed_in?
      flash[:error]="Log in to add friends, like posts, and create comments!!"
      redirect_to new_user_session_path
    end
  end
end
