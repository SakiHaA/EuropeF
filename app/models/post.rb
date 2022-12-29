class Post < ApplicationRecord
  enum stadium: {home: 0, away: 1}
  belongs_to :user
  belongs_to :player
end
