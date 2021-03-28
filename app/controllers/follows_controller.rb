class FollowsController < ApplicationController
    def show
        if session[:follower]
            @msg = "Following:"
            @user = UserHelper.user_followers(params[:user_id])
        else
            @msg = "Followers:"
            @user = User.find(params[:id])
        end
    end

    def add
        if params[:user_id].to_i == current_user.id
            if params[:user][:id].size > 1
                params[:user][:id].each do |id|
                    if id != ""
                        Follow.create(user_id: current_user.id, following_id: id)
                    end
                end
            end
        end
        redirect_to user_path(current_user)
    end

    private

    # def follow_params
    #     params.require(:follow).permit(:user[:id][], :user_id)
    # end
end
