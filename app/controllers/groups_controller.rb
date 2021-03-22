class GroupsController < ApplicationController

    def new
        if !user_signed_in?
            redirect_to '/users/sign_in'
        end
    end

    def create
        @group = Group.new(group_params)
        if @group.save
            @sub = Subscription.new(user_id: current_user.id, group_id: @group.id, moderator: true, confirmed: true)
            @sub.save
        end
    end

    private

    def group_params
        params.require(:group).permit(:name, :bio)
    end
end
