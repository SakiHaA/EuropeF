class League < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true
  has_many :teams
  has_many :players
  
  def self.looks(search, word)
    if search == "perfect_match"
      @league = League.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @league = League.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @league = League.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @league = League.where("title LIKE?","%#{word}%")
    else
      @league = League.all
    end
  end
end
