class GroupsController < ApplicationController

    def new
        if !user_signed_in?
            redirect_to '/users/sign_in'
        end
    end

    def create
        @group = Group.create(group_params)
        if @group.save
            @sub = Subscription.create(user_id: current_user.id, group_id: @group.id, moderator: true, confirmed: true)
            redirect_to user_path(current_user)
        end
    end

    def show
        @group = Group.find(params[:id])
    end

    def edit
        @group = Group.find(params[:id])
    end

    def update
        #update group members
        @group = Group.find_by(id: params[:id])
        if params[:group][:id].size > 1
            params[:group][:id].each do |id|
                if id != "" 
                    Subscription.create(user_id: id, group_id: @group.id, moderator: false, confirmed: false)
                end
            end
        elsif params[:name].blank? || params[:bio].blank?
            redirect_to edit_group_path(@group), alert: "Fields Cannot Be Blank"
        else
            @group.update(name: params[:name], bio: params[:bio])
            redirect_to group_path(@group)
        end
    end

    private

    def group_params
        params.require(:group).permit(:name, :bio)
    end
end
