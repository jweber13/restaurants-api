# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "cleaning db..."
Comment.destroy_all
Restaurant.destroy_all
User.destroy_all

20.times do |i|
  User.create(username: Faker::Games::DnD.first_name, email: "#user#{i}@email.com", password: "testtest")
end

puts "making restaurants..."
100.times do
  restaurant = Restaurant.new
  restaurant.address = "#{Faker::Address.street_address}, #{Faker::Fantasy::Tolkien.location}"
  restaurant.name = "#{
    [
      Faker::Fantasy::Tolkien.character,
      Faker::Fantasy::Tolkien.race
    ].sample}#{' '+Faker::Games::DnD.language if rand(6) > 3} #{
      [
        Faker::Food.ethnic_category,
        Faker::Restaurant.type
      ].sample}"
  restaurant.user = User.all.sample
  restaurant.save
end

puts "making comments..."
100.times do
  comment = Comment.new(user: User.all.sample, restaurant: Restaurant.all.sample)
  comment.content = [Faker::Restaurant.review, Faker::Fantasy::Tolkien.poem].sample
  comment.save
end
