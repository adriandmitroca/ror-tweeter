# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
User.create!(name:  "admin",
             email: "admin@example.com",
             password:              "admin123",
             password_confirmation: "admin123")

99.times do |n|
  name  = Faker::Internet.user_name
  email = Faker::Internet.safe_email
  password = "password"
  User.create!(name: name,
               email: email,
               password:              password,
               password_confirmation: password)
end

# Tweets
users = User.order(:created_at).take(6)
50.times do
  users.each { |user| user.tweets.create!(body: Faker::Lorem.sentence(2)) }
end

# Relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
