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

    def update
        if params[:post][:likes]
            if !Like.find_by(user_id: current_user.id, post_id: params[:id])
                Like.create(user_id: current_user.id, post_id: params[:id])
                redirect_to group_post_path(PostHelper.group?(params[:id]), params[:id])
            else
                flash[:alert] = "You've Already Liked this Post!"
                redirect_to group_post_path(PostHelper.group?(params[:id]), params[:id])
            end
        end
    end

    private

    def post_params
        params.require(:post).permit(:content, :group_id, :user_id, :title)
    end
end
