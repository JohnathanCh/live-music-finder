class User < ApplicationRecord
  extend SearchHelper

  has_secure_password

  has_many :user_events
  has_many :events, through: :user_events

  validates :name, presence: true

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :age, presence: true
  validates :age, numericality: true
  validates :age, inclusion: { in: (18..100), message: "You have to be at least 18 to sign up, sorry."}

  # instance methods

  def event_artists
    self.events.map do |event|
      event.artists
    end.flatten.uniq
  end

  # class methods

  def self.most_events
    self.all.sort_by do |user|
      user.events.count
    end.reverse[0..4]
   end

   def self.oldest_user
     self.all.sort_by do |user|
       user.age
     end.reverse[0..4]
   end

   def self.youngest_user
     self.all.sort_by do |user|
       user.age
     end[0..4]
   end

   def self.search(query)
     self.where('lower(name) LIKE :contains_query OR lower(email) = :query', query: query, contains_query: contains(query))
   end

end
