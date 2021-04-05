module SubscriptionHelper

    def subs_to_users(subs)
        User.where(id: subs.map(&:user_id))
    end

end