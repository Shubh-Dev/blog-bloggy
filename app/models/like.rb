class Like < ApplicationRecord
  belongs_to :user, optional: true, foreign_key: 'author_id'
  belongs_to :post, optional: true, foreign_key: 'post_id'

  after_save :update_likes_counter

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
