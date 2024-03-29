# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(first_name: "suzuki", last_name: "ichiro", user_name: "ichiro", email: "ichiro@gmail.com",
             password: "foobar", password_confirmation: "foobar", admin: true)


99.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user_name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(first_name: first_name, last_name: last_name, user_name: user_name, email: email,
               password: password, password_confirmation: password
               )
end

users = User.order(:created_at).take(6)
50.times do 
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end
