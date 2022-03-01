class FriendsController < ApplicationController
  before_action :set_friend, only: %i[ show edit update destroy ]

  # GET /friends or /friends.json
  def index
    @friends = Friend.all
    @user = User.new
  end

  # GET /friends/1 or /friends/1.json
  def show
  end

  # GET /friends/new
  def new
    @friend = Friend.new
  end

  # GET /friends/1/edit
  def edit
  end
 
  # POST /friends or /friends.json
  def create

    if params[:self_user_id] != params[:user_id] 
      
      @friend = Friend.new(status: 0, self_user_id:params[:self_user_id], users_id: params[:user_id])
      respond_to do |format|
        if @friend.save
          format.html { redirect_to posts_path, notice: "Friend was successfully created." }
          format.json { render :show, status: :created, location: @friend }
        else
          format.html { redirect_to posts_path, status: :unprocessable_entity }
          format.json { render json: @friend.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:add_friend] = "Not Add friend your self!!"
      redirect_to posts_path
    end
  end

  # PATCH/PUT /friends/1 or /friends/1.json
  def update

    respond_to do |format|
      if @friend.update(status: 1)
        format.html { redirect_to friends_path, notice: "Friend was successfully updated." }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { redirect_to friends_path, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1 or /friends/1.json
  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_path, notice: "Friend was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:status, :self_user_id, :user_id)
    end
end
