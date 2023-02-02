class User < ApplicationRecord
  has_many :posts, class_name: 'post', foreign_key: 'author_id'
  has_many :likes, class_name: 'likes', foreign_key: 'author_id'
  has_many :comments, class_name: 'comments', foreign_key: 'author_id'

  def last_3_posts
    Post.order(created_at: :desc).limit(3)
  end
end
