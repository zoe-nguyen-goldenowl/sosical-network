class CommentsController < ApplicationController
  before_action :set_comment , only: %i[destroy ]
  before_action :set_post , only: %i[ create]

 
    def index
      @comments= Comment.where(commentable_id: params[:post_id])
      @user= User.all
    end

    def create   
      if Comment.create(content: params[:content], commentable: @commentable, owner: current_user)
        respond_to do |format|

          flash[:success]="Comment successful!!"
          format.html{redirect_to post_comments_url(post_id: @commentable.id)}
        end

      else
        respond_to do |format|
          flash[:error]="Fail"
          format.html{redirect_to  post_comments_url(post_id: @commentable.id)}
          
        end
      end           
    end

    def destroy
      if @comment.destroy
        flash[:success]="Comment destroy successful!!"
        redirect_to post_comments_url(post_id: @comment.commentable_id)
      else
        flash[:error]="Comment destroy fails!!"
        redirect_to  post_comments_url(post_id: @comment.commentable_id)
        
      end
    end

    private
    def set_comment   
      @comment = Comment.find(params[:id])
    end
    def set_post  
      @commentable = Post.find(params[:post_id])
    end
end
