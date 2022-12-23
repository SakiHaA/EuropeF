class Post < ApplicationRecord
  enum stadium: {home: 0, away: 1}
  has_many :teams
  has_many :posts
end
