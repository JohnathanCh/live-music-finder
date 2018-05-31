class Event < ApplicationRecord
  has_many :performances
  has_many :artists, through: :performances

  has_many :user_events
  has_many :users, through: :user_events


  def self.most_users

    self.all.max_by do |event|
      event.users.count
    end
  end

  def self.most_artists
    self.all.max_by do |event|
      event.artists.count
    end
  end

end
