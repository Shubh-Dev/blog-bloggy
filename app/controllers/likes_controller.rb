class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(author_id: @user.id)
    if @like.save
      redirect_to user_post_path(@user, params[:post_id])
    else
      render 'posts/show'
    end
  end
end
