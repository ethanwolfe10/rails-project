module UserHelper
    def group_name(sub)
        Group.find_by(id: sub.group_id).name
    end
    
    def group_bio(sub)
        Group.find_by(id: sub.group_id).bio
    end

    def group_users(sub)
        Group.find_by(id: sub.group_id).users.where("confirmed = true")
    end

    def invitations(user)
        Subscription.select(:group_id).where(["user_id = ? and confirmed = ?", user.id, false])
    end
end