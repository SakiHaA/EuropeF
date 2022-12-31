class League < ApplicationRecord
  validates :league_name, presence: true
  validates :league_introduction, presence: true
  has_many :teams, dependent: :destroy
  has_many :players, dependent: :destroy

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
