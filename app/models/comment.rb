class Comment < ApplicationRecord
  belongs_to :post, inverse_of: :comments, foreign_key: 'post_id'
  belongs_to :user, inverse_of: :comments, foreign_key: :author_id

  validates :text, presence: true, length: { maximum: 1000 }

  after_save :update_comments_counter

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
