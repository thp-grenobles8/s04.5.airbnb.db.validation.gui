# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Vidange de base ...'
Booking.destroy_all
Room.destroy_all
User.destroy_all
City.destroy_all
puts '.................. base vidangée'


puts 'CITIES ------------------'
5.times {
  c = City.create!(
    name: Faker::Games::Pokemon.location,
    zip: Faker::Base.regexify(/[0-8][0-9][0-9]{3}/)
  )
  puts "city #{c.name}"
}

puts 'USERS ------------------'
10.times {
  u = User.create!(
    name: Faker::Name.first_name,
    email: Faker::Internet.email,
    description: Faker::Lorem.sentence(10),
    phone: Faker::Base.regexify(/^0[1-9](\d{2}){4}$/)
  )
  puts "user #{u.name} with phone #{u.phone}"
}

puts 'ROOMS ------------------'
30.times {
  r = Room.create!(
    beds: rand(1..5),
    price_per_night: rand(5..250),
    wifi: [true,false].sample,
    description: Faker::Quote.yoda,
    welcome_message: Faker::Quote.famous_last_words,
    city: City.all.sample,
    owner: User.all.sample
  )
  puts "room #{r.id} in #{r.city.name} owned by #{r.owner.name}"
}

puts 'BOOKINGS -----------------'
start =  Date.new(rand(2007..2025), rand(1..12), rand(1..28))
40.times {
  b = Booking.new(
    start: start,
    end: start+rand(1..7).day,
    booked_room: Room.all.sample,
    guest: User.all.sample
  )
  if b.valid?
    b.save
    puts "#{b.guest.name} booked room #{b.booked_room.id}"
  else
    puts "---Date overlap problem !"
  end
}
