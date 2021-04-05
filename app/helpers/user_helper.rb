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

    def invited_members(subs)
        User.where(id: subs.map(&:user_id))
    end

    def self.user_followers(user)
        Following.find_by(id: user)
    end

    def not_following?(user)
        User.where.not(id: user.follows.map(&:following_id)).select{|x| x[:id] != user.id}
    end

    def is_following?(user)
        User.where(id: user.follows.map(&:following_id))
    end

    def potential_members?(user, group)
        User.where(id: user.follows.map(&:following_id).select{|x| !group.users.include?(User.find(x))})
    end
end