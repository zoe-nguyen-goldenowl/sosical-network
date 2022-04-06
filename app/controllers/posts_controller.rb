class PostsController < ApplicationController
  before_action :require_login, only: %i[ edit update destroy  ]
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @pagy, @posts= pagy(Post.all.order(created_at: :desc))
    @post= Post.new
  end

  def edit
  end

  def create
    @post= Post.new(post_params.merge(user_id: current_user.id))
    
    if @post.save
      # @posts=Post.all
      flash[:success] = "Post was successfully created!!"
      respond_to do |format|
        redirect_to posts_path
        format.js{} 
      end 
    else
      respond_to do |format|
        flash[:error] = "Post was fail created!!"
        render :index
      end 
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post was successfully destroyed!!"
    redirect_to posts_path
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content, :image)
    end

    def require_login
      if !user_signed_in?
        flash[:error]="Log in to add friends, like posts, and create comments!!"
        redirect_to new_user_session_path
      end
    end
end
