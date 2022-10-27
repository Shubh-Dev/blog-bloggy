class User < ApplicationRecord
  has_many :posts, dependent: :destroy, inverse_of: :user, foreign_key: 'author_id'
  has_many :comments, dependent: :destroy, inverse_of: :user, foreign_key: 'author_id'
  has_many :likes, through: :posts, dependent: :destroy

  validates :name, presence: true

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
