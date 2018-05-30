class Event < ApplicationRecord
  has_many :performances
  has_many :artist, through: :performances

  has_many :user_events
  has_many :users, through: :user_events
end
