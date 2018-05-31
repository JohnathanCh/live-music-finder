class User < ApplicationRecord
  has_secure_password
  
  has_many :user_events
  has_many :events, through: :user_events

  validates :name, presence: true

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :age, presence: true
  validates :age, numericality: true
  validates :age, inclusion: { in: (18..100), message: "You have to be at least 18 to sign up, sorry."}
end
