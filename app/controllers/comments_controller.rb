class CommentsController < ApplicationController
    def create
        @comment = current_user.comments.new(comment_params)
        if @comment.save
            redirect_to user_post_path(current_user.id, params[:post_id])
        else
            render 'new'
        end
    end

    def new
        @comment = Comment.new
    end

        private

        def comment_params
            params.require(:comment).permit(:text)
        end

end
