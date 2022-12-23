class Player < ApplicationRecord
  belongs_to :team
  belongs_to :league
  belongs_to :post
end
