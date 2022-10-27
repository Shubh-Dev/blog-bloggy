class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(author_id: current_user.id)
    if @like.save
      redirect_to user_post_path(current_user, params[:post_id])
    else
      render 'posts/show'
    end
  end
end
