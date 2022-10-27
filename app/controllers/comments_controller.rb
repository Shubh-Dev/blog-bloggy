class CommentsController < ApplicationController
 
  def create
    @comment = current_user.comments.new(comment_params)
    if !@comment.save
      flash[:notice] = @comment.errors.full_messages.to_sentence.capitalize

    end

    redirect_to user_post_path(current_user, params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(post_id: params[:post_id])
  end
  
  end