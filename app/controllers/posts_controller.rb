class PostsController < ApplicationController
    def new
        @post = Post.new(user_id: current_user.id, group_id: params[:group_id])
    end

    def create
        @post = Post.create(post_params)
        if @post.save
            redirect_to group_path(@post.group_id)
        else
            redirect_to new_group_post_path
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
    end

    private

    def post_params
        params.require(:post).permit(:content, :group_id, :user_id)
    end
end
