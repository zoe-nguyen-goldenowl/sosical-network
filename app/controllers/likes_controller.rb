class LikesController < ApplicationController
  before_action :require_login, only: %i[create destroy]
  before_action :set_like, only: %i[destroy]
  before_action :set_post ,only: %i[create destroy]

  def create
    @like= Like.new(user_id: current_user.id, post_id: params[:post_id])
    @href= post_like_path( params[:post_id])
    if @like.save
      respond_to do |format|
        format.js { render "create", layout: false, content_type: 'text/javascript' }
      end
      ActionCable.server.broadcast "like", {count_like: @post.likes.size, post_id: params[:post_id]} 
     
    end
    
  end

  def destroy
    if @like.destroy
      ActionCable.server.broadcast "like", {count_like: @post.likes.size, post_id: params[:post_id]} 
      @href= post_likes_path( params[:post_id])
      respond_to do |format|
        format.js { render "destroy", layout: false, content_type: 'text/javascript' }
      end
  
    else    
      flash[:error] = "like was fail destroy" 
      redirect_to posts_path 
    end
  end

  private
    def set_like   
      @like = Like.find_by( post_id: params[:post_id], user_id: current_user.id )
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
