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
# Admin.create(username: "admin2", first_name: "Jane", last_name: "Smith", email: "admin2@example.com", password: "password", profile_picture: "admin2_profile.jpg")
# ... Add more admins if needed

# Clients seed data
Client.create(username: "KenMusau", first_name: "Kennedy", last_name: "Musau", email: "kennedy@gmail.com", password: "123456", profile_picture: "https://i.pravatar.cc/48")
Client.create(username: "client2", first_name: "Bob", last_name: "Anderson", email: "bob@example.com", password: "password", profile_picture: "https://i.pravatar.cc/48")
# ... Add more clients if needed

# db/seeds.rb
image_urls = ["https://images.unsplash.com/photo-1584132967334-10e028bd69f7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", "https://images.unsplash.com/photo-1596436889106-be35e843f974?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", "https://images.unsplash.com/photo-1620332372374-f108c53d2e03?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2072&q=80", "https://plus.unsplash.com/premium_photo-1661964225206-fd5d445a6edd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80", "https://images.unsplash.com/photo-1604014237800-1c9102c219da?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", "https://images.unsplash.com/photo-1506059612708-99d6c258160e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2069&q=80", "https://plus.unsplash.com/premium_photo-1673626577922-1b3f9771fc3f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", "https://images.unsplash.com/photo-1600585152915-d208bec867a1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2052&q=80", "https://images.unsplash.com/photo-1600607687920-4e2a09cf159d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80", "https://images.unsplash.com/photo-1416331108676-a22ccb276e35?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2067&q=80", "https://images.unsplash.com/photo-1602002418816-5c0aeef426aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80"]
# Spaces seed data
10.times do
  Space.create(
    name: Faker::Fantasy::Tolkien.location,
    location: Faker::Address.street_address,
    price: Faker::Number.decimal(l_digits: 2),
    status: [true, false].sample,
    image: image_urls.sample,
    description: Faker::Lorem.paragraph,
    contact: Faker::PhoneNumber.phone_number,
    admin_id: rand(1..Admin.count),
    client_id: rand(1..Client.count),
  )
end

# Seed data for bookings
10.times do
  Booking.create(
    status: [true, false].sample,
    check_in: Faker::Time.between_dates(from: Date.today - 30, to: Date.today + 30, period: :day),
    check_out: Faker::Time.between_dates(from: Date.today + 1, to: Date.today + 60, period: :day),
    space_id: rand(1..Space.count),
    client_id: rand(1..Client.count),
  )
end

10.times do
  Payment.create(
    amount: Faker::Number.between(from: 50, to: 500),
    booking_id: rand(1..Booking.count),
    payment_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
    status: [true, false].sample,
  )
end

puts "🌱🌱...seeding completed "
