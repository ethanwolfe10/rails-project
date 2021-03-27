class UsersController < ApplicationController

    def show
        if params[:user_id] && !User.exists?(params[:user_id])
            redirect_to new_user_session_path
        else
           @current_user = User.find(params[:id])
        end
    end
    
end