class Player < ApplicationRecord
  validates :player_name, presence: true
  validates :player_introduction, presence: true
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
