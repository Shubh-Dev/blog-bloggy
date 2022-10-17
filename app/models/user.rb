class User < ApplicationRecord
  has_many :posts, dependent: :destroy, inverse_of: :user, foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
