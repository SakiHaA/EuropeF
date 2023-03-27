class Post < ApplicationRecord
  validates :game_date, presence: true
  validates :contents, presence: true
  enum stadium: { home: 0, away: 1 }

  belongs_to :user
  belongs_to :team
  belongs_to :player
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search(keyword)
    where(["contents like ? or game_date like ?", "%#{keyword}%" , "%#{keyword}%"])
  end
  
end