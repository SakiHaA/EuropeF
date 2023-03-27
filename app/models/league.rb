class League < ApplicationRecord
  validates :league_name, presence: true
  validates :league_image, presence: true
  has_many :teams, dependent: :destroy
  has_many :players, dependent: :destroy
end
