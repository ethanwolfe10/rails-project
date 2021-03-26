class CommentsController < ApplicationController
    def new
        @comment = Comment.new(user_id: current_user.id, post_id: params[:post_id])
    end

    def create
        @comment = Comment.create(comment_params)
        if @comment.save
            redirect_to group_post_path(id: @comment.post_id, group_id: CommentHelper.post_group(@comment).id)
        else
            redirect_to new_post_comment_path
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :post_id)
    end
end