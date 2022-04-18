class LikesController < ApplicationController
  before_action :require_login, only: %i[create destroy]
  before_action :set_like, only: %i[destroy]
  before_action :set_post ,only: %i[create destroy]

  def create
    @like= Like.new(user_id: current_user.id, post_id: params[:post_id])
    
    if @like.save  
      ActionCable.server.broadcast "like", {count_like: @post.likes.size, post_id: params[:post_id], like_icon: '<a data-method= "delete" data-remote= "true"> <i class= "bi bi-hand-thumbs-up-fill" style= "color: #fe2c55;"></i> </a>', href: post_like_path( params[:post_id])} 
    end
    
  end

  def destroy
    if @like.destroy
      ActionCable.server.broadcast "like", {count_like: @post.likes.size, post_id: params[:post_id], like_icon: '<a data-method= "post" data-remote= "true"> <i class= "bi bi-hand-thumbs-up-fill"></i> </a>', href: post_likes_path( params[:post_id])} 

  
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
