class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
    @post = Post.new
  end

  # GET /posts/1 or /posts/1.json
  def show
    
   
    
  end

  # GET /posts/new
  def new
    @post = Post.new
   
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    
    @post = Post.new(post_params)
    @post.user_id= current_user.id
    respond_to do |format|
      if @post.save
        flash[:create_friend] = "Post was successfully created!!"
        format.html { redirect_to posts_path}
              
      else
        flash[:create_friend] = "Post was fail created!!"
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    
    if @post.update(post_params)
      redirect_to posts_path
    else
      redirect_to edit_post_path(@post)
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      flash[:destroy_friend] = "Post was successfully destroyed!!"
      format.html { redirect_to posts_url}

    end
  end
#=====like posts=====


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
       params.require(:post).permit(:content, :image)
    end
end
