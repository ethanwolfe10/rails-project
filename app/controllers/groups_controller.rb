class GroupsController < ApplicationController

    def new
        if !user_signed_in?
            redirect_to '/users/sign_in'
        end
    end

    def create
        @group = Group.create(group_params)
        if @group.save
            @sub = Subscription.new(user_id: current_user.id, group_id: @group.id, moderator: true, confirmed: true)
            @sub.save
            redirect_to user_path(current_user)
        end
    end

    def show
        @group = Group.find(params[:id])
    end

    def edit
    end

    def update
        #update group members
        params[:user][:id].each do |id|
            if id != "" 
                Subscription.create(user_id: id, group_id: params[:id], moderator: false, confirmed: false)
            end
        end
        redirect_to group_path(params[:id])
    end

    private

    def group_params
        params.require(:group).permit(:name, :bio)
    end
end
