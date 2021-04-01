module GroupHelper

    def moderator?(user, gid)
        Subscription.find_by(group_id: gid, user_id: user.id).moderator
    end


    
end
