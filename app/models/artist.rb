class Artist < ApplicationRecord
  has_many :performances
  has_many :events, through: :performances


  def self.most_events

    self.all.max_by do |artist|
      artist.events.count
    end
  end



end
