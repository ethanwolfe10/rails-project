class PostsController < ApplicationController
    def new
        if confirmed?(current_user, params[:group_id])
            @post = Post.new(user_id: current_user.id, group_id: params[:group_id])
        else
            redirect_to user_path(current_user), alert: "Must Confirm Subscription To Create Posts"
        end
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

    def edit
        if current_user.id != params[:user_id].to_i
            redirect_to user_path(current_user)
        else
            @post = Post.find(params[:id])
        end
    end

    def update
        @post = Post.find(params[:id])
        #updating a posts likes 
        if params[:commit] == "Unlike Post"
            Like.find_by(user_id: current_user.id, post_id: params[:id]).destroy
            redirect_to group_path(@post.group_id) and return
        end
        if params[:post][:likes]
            if !Like.find_by(user_id: current_user.id, post_id: params[:id])
                Like.create(user_id: current_user.id, post_id: params[:id])
                redirect_to group_post_path(PostHelper.group?(params[:id]), params[:id])
            else
                flash[:alert] = "You've Already Liked this Post!"
                redirect_to group_post_path(PostHelper.group?(params[:id]), params[:id])
            end
        end
        #updating a posts title and content
        if !params[:post][:title].blank? && !params[:post][:content].blank?
            if @post.title != params[:post][:title]
                @post.update(title: params[:post][:title] + " *EDITED*")
            end
            if @post.content != params[:post][:content]
                @post.update(content: params[:post][:content] + " *EDITED*")
            end
            redirect_to group_post_path(@post.group_id, @post.id)
        end
            

        
        
    end

    private

    def post_params
        params.require(:post).permit(:content, :group_id, :user_id, :title)
    end
end
