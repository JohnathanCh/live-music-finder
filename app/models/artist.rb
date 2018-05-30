class Artist < ApplicationRecord
  has_many :performances
  has_many :events, through: :performances
end
