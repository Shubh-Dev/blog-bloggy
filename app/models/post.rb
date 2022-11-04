class Post < ApplicationRecord
  belongs_to :user, optional: true, foreign_key: 'author_id'
  has_many :comments, dependent: :destroy, inverse_of: :post, foreign_key: 'post_id', counter_cache: :comments_counter
  has_many :likes, dependent: :destroy, inverse_of: :post, foreign_key: :post_id, counter_cache: :likes_counter

  validates :title, presence: true, length: { minimum: 5, maximum: 250 }
  validates :text, presence: true, length: { minimum: 5, maximum: 1000 }

  after_create :counter_increment
  after_destroy :counter_decrement

  def counter_increment
    self.user.posts_counter += 1
    self.user.save
  end

  def counter_decrement
    self.user.posts_counter -= 1
    self.user.save
  end

  def show_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
