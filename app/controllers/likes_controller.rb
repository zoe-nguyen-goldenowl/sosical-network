class LikesController < ApplicationController
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

    if Like.exists?(user_id: params[:user_id], post_id: params[:post_id])
     destroy
    else
      @like= Like.new(user_id: params[:user_id], post_id: params[:post_id])
      respond_to do |format|
        if @like.save
          flash[:like] = "like was successfully created." 
          format.html { redirect_to posts_path}
        else
          flash[:like] = "like was fail created." 
          format.html { redirect_to posts_path}
        end
      end
    end
  end

  # DELETE /likes/1 or /likes/1.json
  def destroy
    set_like
    if @like.destroy
      respond_to do |format|
        flash[:like] = "like was successfully destroy" 
          format.html { redirect_to posts_path}
      end
    else
      respond_to do |format|
        flash[:like] = "like was fail destroy" 
        format.html { redirect_to posts_path}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find_by(user_id: params[:user_id], post_id: params[:post_id])
    end
end
