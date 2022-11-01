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

  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy
    if @post.destroy
      flash[:notice] = 'Post deleted'

      redirect_to user_posts_path(current_user)
    else
      flash[:notice] = 'Post not deleted'
    end
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)
    if @post.save
      redirect_to user_posts_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
