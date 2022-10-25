class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user: @user).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new 

  end

  def create
    @post = current_user.posts.new(params.require(:post).permit(:title, :text))
    # @post = Post.new(params.require(:post).permit(:title, :text))
    @post.save
  end

  # private

  # def post_params
  #   params.require(:post).permit(:title, :text)
  # end

end
