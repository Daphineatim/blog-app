class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def last_5_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end

  def update_post_count_for_user
    user = User.find_by(id: user_id)
    counter = Post.where(user_id: user.id).count
    author.increment!(posts_counter)
  end
end
