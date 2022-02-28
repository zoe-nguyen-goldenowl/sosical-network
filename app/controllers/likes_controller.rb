class LikesController < ApplicationController
   before_action :set_like, only: %i[ show edit update destroy ]

  # GET /likes or /likes.json
  def index
    @likes = Like.all
  end

  # GET /likes/1 or /likes/1.json
  def show
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes or /likes.json
  def create
    if Like.exists?(users_id: params[:users_id], posts_id: params[:posts_id])
     destroy
    else
      @like= Like.new(users_id: params[:users_id], posts_id: params[:posts_id])
      respond_to do |format|
        if @like.save
          format.html { redirect_to like_url(@like), notice: "like was successfully created." }
          format.json { render :show, status: :created, location: @like }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @like.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /likes/1 or /likes/1.json
  def update
    # respond_to do |format|
    #   if @like.update(like_params)
    #     format.html { redirect_to like_url(@like), notice: "like was successfully updated." }
    #     format.json { render :show, status: :ok, location: @like }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @like.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /likes/1 or /likes/1.json
  def destroy
    
    @like= set_like
    if @like.destroy
      respond_to do |format|
        format.html { redirect_to posts_path, notice: "Like was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to posts_path, notice: "Like was Fail destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find_by(users_id: params[:users_id], posts_id: params[:posts_id])
    end


    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:users_id, :posts_id)
    end

end
