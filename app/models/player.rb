class Player < ApplicationRecord
  validates :player_name, presence: true
  validates :player_nationality, presence: true
  validates :player_age, presence: true
  validates :player_height, presence: true
  validates :player_weight, presence: true
  validates :player_introduction, presence: true
  validates :player_image, presence: true
  validates :player_tags, presence: true
  
  has_many :posts, dependent: :destroy
  has_many :player_tags, dependent: :destroy
  has_many :tags, through: :player_tags
  # has_many :comments, dependent: :destroy
  
  belongs_to :team
  belongs_to :league
  
end