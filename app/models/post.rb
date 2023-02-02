class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'

  def last_5_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end

  def self.update_post_count_for_user(author)
    author.increment!(:posts_counter)
  end
end
