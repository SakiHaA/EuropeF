class Comment < ApplicationRecord
  validates :comment_contents, presence: true
  belongs_to :user
  belongs_to :post
end