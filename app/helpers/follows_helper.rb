module FollowsHelper
    def follower_collect(user)
        if user.class.name == "Following"
            followers = Follow.select(:following_id).where("user_id = #{user.id}").all
            ids = followers.map(&:following_id)
        else
            binding.pry
            followers = Follow.select(:user_id).where("following_id = #{user.id}").all
            ids = followers.map(&:user_id)
        end
        User.where(id: ids)
    end
        
end
