class CommentPostsController < ApplicationController
  before_action :require_login, only: %i[ create ]
  before_action :set_post, only: %i[create]
  
  def create 
    if @post.comments.create(content: params[:content], owner: current_user)
      ActionCable.server.broadcast "comment",{count_comment: @post.comments.size()}
      @comment= @post.comments.last 
     
      redirect_to post_comments_path(@post.id)

    else
      flash[:error]="Fail"   
      redirect_to posts_path
    end
  end

  private
  def set_post   
    @post = Post.find(params[:id])
  end

  def require_login
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
end