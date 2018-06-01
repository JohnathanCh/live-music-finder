class Artist < ApplicationRecord
  has_many :performances
  has_many :events, through: :performances

  # instance methods

  # class methods

  def self.most_events

    self.all.max_by do |artist|
      artist.events.count
    end
  end

  def self.search(query)

  end

end
