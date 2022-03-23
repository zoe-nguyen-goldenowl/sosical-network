class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    id_user_post = set_user_ids
    @pagy, @posts = pagy(Post.where(user_id: id_user_post).order(created_at: :desc))
    @post = Post.new
  end

  def show 
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id= current_user.id

    if @post.save
      id_user_post= set_user_ids
      @posts=Post.where(user_id: id_user_post).order(created_at: :desc)
      flash[:success] = "Post was successfully created!!"
      respond_to do |format|
        format.js{} 
      end 
    else
      respond_to do |format|
        flash[:error] = "Post was fail created!!"
        # sua lai
        format.html { render :new, status: :unprocessable_entity }
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
    redirect_to posts_url
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
       params.require(:post).permit(:content, :image)
    end
    
    def set_user_ids
      @friends_post= Friend.active_friend current_user.id
      user_id_post=[current_user.id]   
        @friends_post.each do |f|
          user_id_post<< f.self_user_id << f.user_id
        end
      return user_id_post.uniq
    end
end
