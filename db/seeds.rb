# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Nasa",
  email: "nasa@gmail.com",
  password:
  "111111",
  password_confirmation: "111111")
  # Generate a bunch of additional users.
  20.times do |n|
  name = Faker::Name.name
  email = "nasa-#{n+1}@gmail.com"
  password = "password"
  User.create!(name: name,
  email: email,
  password:
  password,
  password_confirmation: password)
  end
  