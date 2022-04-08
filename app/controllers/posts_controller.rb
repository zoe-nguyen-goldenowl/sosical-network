class PostsController < ApplicationController
  before_action :require_login, only: %i[ edit update destroy  ]
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @pagy, @posts= pagy(Post.all, items: 5)
    @post= Post.new
    respond_to do |format|
      format.html
      format.json { render json: { entries: render_to_string(partial: 'posts/post', locals: { posts: @posts }, formats: [:html]), pagination: view_context.pagy_bootstrap_nav(@pagy)}}
    end
  end

  def edit
  end

  def create
    @post= Post.new(post_params.merge(user_id: current_user.id))
    
    if @post.save
      flash[:success] = "Post was successfully created!!"
      redirect_to posts_path
      
    else
      flash[:success] = "Post was successfully created!!"
      redirect_to posts_path
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
        redirect_to new_user_session_path
      end
    end
end
