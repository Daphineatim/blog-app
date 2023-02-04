class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_comment_counter_for_post

  private

  def update_comment_counter_for_post
    post.increment!(:comments_counter)
  end
end
