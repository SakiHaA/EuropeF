class PlayerTag < ApplicationRecord
  belongs_to :player
  belongs_to :tag
end
