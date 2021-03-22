class GroupsController < ApplicationController

    def new
        if !user_signed_in?
            redirect_to '/users/sign_in'
        end
    end

    def create
        binding.pry
    end
end
