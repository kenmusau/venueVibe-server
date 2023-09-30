# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

# db/seeds.rb
puts "seeding....🌱"

# Admins seed data
Admin.create(username: "admin1", first_name: "John", last_name: "Doe", email: "admin1@example.com", password: "password", profile_picture: "admin1_profile.jpg")
Admin.create(username: "admin2", first_name: "Jane", last_name: "Smith", email: "admin2@example.com", password: "password", profile_picture: "admin2_profile.jpg")
# ... Add more admins if needed

# Clients seed data
Client.create(username: "client1", first_name: "Alice", last_name: "Johnson", email: "alice@example.com", password: "password", profile_picture: "client1_profile.jpg")
Client.create(username: "client2", first_name: "Bob", last_name: "Anderson", email: "bob@example.com", password: "password", profile_picture: "client2_profile.jpg")
# ... Add more clients if needed

# db/seeds.rb

# Spaces seed data
10.times do
  Space.create(
    name: Faker::Lorem.word,
    location: Faker::Address.city,
    price: Faker::Number.decimal(l_digits: 2),
    status: [true, false].sample,
    image: Faker::LoremFlickr.image,
    description: Faker::Lorem.paragraph,
    contact: Faker::PhoneNumber.phone_number,
    admin_id: rand(1..Admin.count),
    client_id: rand(1..Client.count),
  )
end

puts "🌱🌱...seeding completed "
