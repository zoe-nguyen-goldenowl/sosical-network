class CommentsController < ApplicationController
  
    def index
      
      if !params[:post_id].nil? ? @@commentable=Post.find(params[:post_id]) : @@commentable=Post.find(params[:format])
        params[:post_id] ||= params[:format]
      end
      @comments= Comment.where("commentable_id = '#{params[:post_id]}'")
      @user= User.all
    end

    def create 
     
      if Comment.create(content: params[:content], commentable: @@commentable, owner: current_user)
        respond_to do |format|
          format.html{redirect_to comments_path(@@commentable)}
        end
      else
        respond_to do |format|
          flash[:error]="Fail"
          format.html{redirect_to comments_path}
          
        end
      end           
    end

    def destroy
      
      @comment = Comment.find(params[:format])
      if @comment.destroy
        flash[:success]="Comment destroy successful!!"
        redirect_to posts_path
      else
        flash[:error]="Comment destroy fails!!"
        redirect_to posts_path
        
      end
    end
end
