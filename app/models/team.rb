class Team < ApplicationRecord
  validates :team_name, presence: true
  validates :team_introduction, presence: true
  belongs_to :league
  has_many :players, dependent: :destroy
  has_many :posts
  
  
  def self.looks(search, word)
    if search == "perfect_match"
      @team = Team.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @team = Team.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @team = Team.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @team = Team.where("name LIKE?","%#{word}%")
    else
      @team = Team.all
    end
  end
end
