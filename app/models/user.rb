class User < ApplicationRecord
  has_many :posts, dependent: :destroy, inverse_of: :user, foreign_key: 'author_id'
  has_many :comments, through: :posts
  has_many :likes, through: :posts, dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
