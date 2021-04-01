class StaticController < ApplicationController

    def home
        if user_signed_in?
            redirect_to user_path(current_user)
        else
            redirect_to '/users/sign_in'
        end
    end

end
