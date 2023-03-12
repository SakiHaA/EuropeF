class Team < ApplicationRecord
  validates :team_name, presence: true
  validates :team_image, presence: true
  belongs_to :league
  has_many :players, dependent: :destroy
  has_many :posts
end