class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_comment_counter_for_post
    post = Post.find_by(id: post_id)
    count = Comment.where(post_id: post.id).count
    post.update(CommentsCounter: count)
  end
end
