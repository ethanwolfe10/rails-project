class UsersController < ApplicationController
    def index
    end

    def show
        if params[:user_id] && !User.exists?(params[:user_id])
            redirect_to new_user_session_path
        else
           @user = User.find(params[:id])
        end
    end

    def edit
        if current_user.id != params[:id].to_i
            redirect_to user_path(current_user)
        end
    end

    def update
        if !params[:user][:display_name].blank?
            current_user.update(display_name: params[:user][:display_name], bio: params[:user][:bio])
            redirect_to user_path(current_user)   
        else
            redirect_to edit_user_path(current_user)
            flash[:alert] = "Invalid Display Name"
        end            
    end
    
end