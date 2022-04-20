class CommentsController < ApplicationController
  before_action :require_login, only: %i[ create destroy]
  before_action :set_post, only: %i[index create destroy]
  before_action :set_comment, only: :destroy
 
  def index
    @comments= @post.comments
    @user= User.find(@post.user_id)
      respond_to do |format|
        format.html
        format.js{render "index", layout: false, content_type: 'text/javascript'}
      end
  end

  def create 
    if @post.comments.create(content: params[:content], owner: current_user)
      ActionCable.server.broadcast "comment",{count_comment: @post.comments.size()}
      @comments= @post.comments
      respond_to do |format|
        format.js{render "create", layout: false, content_type: 'text/javascript'}
      end

      # redirect_to post_comments_path
    else
      flash[:error]="Fail"
      redirect_to post_comments_path(@post.id)
    end           
  end

  def destroy
    authorize @comment
    
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

  def require_login
    if !user_signed_in?
      flash[:error]="Log in to add friends, like posts, and create comments!!"
      set_post 
      redirect_to post_comments_path(@post.id)
    end
  end
end

