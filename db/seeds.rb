# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: "Daisuke Yoshihiro",
  email: "cape.jasm1ne3@gmail.com",
  password: "password",
  admin: true
)

50.times do |n|
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: "password",
    admin: false
  )
end

user = User.first
followers = User.all

followers[2..50].each do |follower|
    follower.follow(user)
end

followers[40..50].each do |follower|
    user.follow(follower)
end