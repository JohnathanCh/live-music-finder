class Artist < ApplicationRecord
  extend SearchHelper

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
    self.where('lower(name) LIKE :contains_query', contains_query: contains(query))
  end

end
