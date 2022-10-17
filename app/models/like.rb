class Like < ApplicationRecord
  belongs_to :user, inverse_of: :likes, foreign_key: :user_id
  belongs_to :post, inverse_of: :likes, foreign_key: :post_id
end
