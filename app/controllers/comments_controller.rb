class CommentsController < ApplicationController
  before_action :require_login, only: %i[ create destroy]
  before_action :set_post, only: %i[index create destroy]
  before_action :set_user, only: :destroy
  before_action :set_comment, only: :destroy
 
  def index
    @comments= @post.comments
    @user= User.find(@post.user_id)
  end

  def create 
    if @post.comments.create(content: params[:content], owner: current_user)
      redirect_to post_comments_path(@post.id)

    else
      flash[:error]="Fail"
      redirect_to post_comments_path(@post.id)
    end           
  end

  def destroy
    if @comment.destroy
      flash[:success]="Comment destroy successful!!"
      redirect_to post_comments_path(@post.id)

    else
      flash[:error]="Comment destroy fails!!"
      redirect_to post_comments_path(@post.id)

    end
  end

  private
  def set_post   
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment= Comment.find(params[:id])
  end
  
  def set_user
    set_comment

    if @comment.owner_id != current_user.id
      flash[:error]= "You can't destroy other people's comments"
      redirect_to posts_path
    end
  end

  def require_login
    if !user_signed_in?
      flash[:error]="Log in to add friends, like posts, and create comments!!"
      set_post 
      redirect_to post_comments_path(@post.id)
    end
  end
end

