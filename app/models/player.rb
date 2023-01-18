class Player < ApplicationRecord
  validates :player_name, presence: true
  validates :player_introduction, presence: true
  has_many :posts, dependent: :destroy
  has_many :player_tags, dependent: :destroy
  has_many :tags, through: :player_tags
  belongs_to :team
  belongs_to :league

  def self.looks(search, word)
    if search == "perfect_match"
      @player = Player.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @player = Player.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @player = Player.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @player = Player.where("name LIKE?","%#{word}%")
    else
      @player = Player.all
    end
  end
end
