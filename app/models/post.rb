class Post < ApplicationRecord
  belongs_to :user, optional: true, foreign_key: 'author_id'
  has_many :comments, dependent: :destroy, inverse_of: :post, foreign_key: 'post_id'
  has_many :likes, dependent: :destroy, inverse_of: :post, foreign_key: :post_id
end
