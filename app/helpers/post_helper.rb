module PostHelper
    
    def creator?(attr)
        User.find_by(id: attr.user_id)
    end

    def self.group?(id)
        Group.find(Post.find(id).group_id)
    end

end
