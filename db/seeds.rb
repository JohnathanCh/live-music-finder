# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

  100.times do
    Artist.create(name: Faker::Music.unique.band)
  end

  100.times do
    User.create(name: Faker::Name.unique.name, age: rand(18..100), email: Faker::Internet.unique.email, password: "12345")
  end

  coachella = Event.create(name: "Coachella")
  elec_picnic = Event.create(name: "Electric Picnic")
  elec_pickle = Event.create(name: "Electric Pickle")
  woodstock = Event.create(name: "Woodstock")
  lollapalooza = Event.create(name: "Lollapalooza")
  warped = Event.create(name: "Warped Tour")
  oz_fest = Event.create(name: "Oz Fest")
  rbc = Event.create(name: "Rubyists Benefit Concert")


  100.times do
    UserEvent.create(user: User.all.sample, event: Event.all.sample)
  end

  1000.times do
    Performance.create(event: Event.all.sample, artist: Artist.all.sample)
  end
