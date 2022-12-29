class Player < ApplicationRecord
  belongs_to :team
  belongs_to :league
  has_many :posts
  
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
