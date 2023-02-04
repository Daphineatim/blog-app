class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_like_counter_for_post

  private

  def update_like_counter_for_post
    # post = Post.find_by(id: post_id)
    # count = Like.where(post_id: post.id).count
    # post.update(LikesCounter: count)
    post.increment!(:likes_counter)
  end
end
