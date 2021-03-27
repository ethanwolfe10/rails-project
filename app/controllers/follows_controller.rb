class FollowsController < ApplicationController
    def show
        if session[:follower]
            @msg = "Following:"
            @user = UserHelper.user_followers(params[:user_id])
            binding.pry
        else
            @msg = "Followers:"
            @user = User.find(params[:id])
            binding.pry
        end
    end
end
