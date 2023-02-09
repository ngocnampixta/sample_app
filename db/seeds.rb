# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create a main sample user.
User.create!(name: "Example User",
             email: "user@gmail.com",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true)
# Generate a bunch of additional users.
99.times do |n|
  User.create!(name: "user User #{n + 1}", email: "example#{n + 1}@gmail.com", password: "password", password_confirmation: "password")
end
