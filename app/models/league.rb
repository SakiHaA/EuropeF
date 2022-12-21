class League < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true
  has_many :teams
  has_many :players
end
