class Like < ApplicationRecord
  belongs_to :user, optional: true, foreign_key: 'author_id'
  belongs_to :post, optional: true, foreign_key: 'post_id'
end
