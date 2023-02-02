class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :update_like_counter_for_post

  def self.update_like_counter_for_post(post)
    post.increment!(:likes_counter)
  end
end
