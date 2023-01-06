class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :player_id, presence: true
  validates :stadium, presence: true
  validates :opponent, presence: true
  validates :contents, presence: true
  
  enum stadium: {home: 0, away: 1}
  
  belongs_to :user
  belongs_to :player
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end