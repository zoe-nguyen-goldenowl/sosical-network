class PostsController < ApplicationController
  before_action :require_login, only: %i[ edit update destroy  ]
  before_action :set_user, only: %i[update destroy  ]
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @pagy, @posts= pagy(Post.all.order(created_at: :desc), items: 2, link_extra: 'data-remote="true"')
    @post= Post.new

    respond_to do |format|
      format.html
      format.js { render 'index', layout: false, content_type: 'text/javascript' }
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

  def set_user
    set_post
    if @post.user_id != current_user.id
      flash[:error]= "You can't edit other people's posts"
      redirect_to posts_path
    end
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
