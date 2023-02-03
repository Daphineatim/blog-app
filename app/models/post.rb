class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'

  validates :Title, presence: true
  validates :Title, length: { maximum: 250 }
  validates :CommentsCounter, numericality: { greater_than_or_equal_to: 0 }
  validates :CommentsCounter, numericality: { only_integer: true }
  validates :LikesCounter, numericality: { greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { only_integer: true }

  after_save :update_post_count_for_user

  def last_5_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end

  private
  
  def self.update_post_count_for_user(author)
    author.increment!(:posts_counter)
  end
end
