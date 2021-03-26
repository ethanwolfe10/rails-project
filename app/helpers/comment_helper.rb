module CommentHelper
    def self.post_group(comment)
        post = Post.find_by(id: comment.post_id)
        Group.find_by(id: post.group_id)
    end
end