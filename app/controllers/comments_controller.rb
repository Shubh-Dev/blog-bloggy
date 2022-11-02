class CommentsController < ApplicationController
  def index
    @user = User.includes(:comments).find(params[:user_id])
    @comments = @user.comments
   
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new

    render :new
  end

  def create
    @user = User.find(params[:user_id])
    @comment = @user.comments.new(comment_params)
    flash[:notice] = @comment.errors.full_messages.to_sentence.capitalize unless @comment.save

    redirect_to user_post_path(current_user, params[:post_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(current_user, params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(post_id: params[:post_id])
  end
end
