class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user: @user).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def delete
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to "/users/#{@post.user.id}/posts/#{@post.id}"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
