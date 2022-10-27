class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new

    render :new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    flash[:notice] = @comment.errors.full_messages.to_sentence.capitalize unless @comment.save

    redirect_to user_post_path(current_user, params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(post_id: params[:post_id])
  end
end
