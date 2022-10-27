class LikesController < ApplicationController
    def create
     @likes = Post.find(params[:post_id]).increment!(:likes_counter)
     if @likes.save
         redirect_to user_post_comments_path(current_user, params[:post_id])
      else
         flash[:alert] = "Something went wrong"
      end
    end
end
