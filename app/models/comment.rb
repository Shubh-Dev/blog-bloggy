class Comment < ApplicationRecord
  belongs_to :post, inverse_of: :comments, foreign_key: 'post_id'
  belongs_to :user, inverse_of: :comments, foreign_key: :author_id
end
