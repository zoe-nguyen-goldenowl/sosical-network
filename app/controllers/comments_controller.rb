class CommentsController < ApplicationController
  before_action :require_login, only: %i[ create destroy];

  before_action :set_post, only: %i[index create destroy];
  before_action :set_comment,only: %i[destroy]

  def index
    @comments = @post.comments
  end

  def create 
    if Comment.create(content: params[:content], commentable: @post, owner: current_user)
      flash[:success]="Comment successful!!"
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

    if @comment.owner_id != current_user.id
      flash[:error]="Delete comment fail!!"
      redirect_to post_comments_path(@comment.commentable_id)
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
