# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all

25.times do |index|
  product = Product.create!(name: Faker::Food.unique.ingredient, image: "http://www.fillmurray.com/200/300", cost: Faker::Commerce.price, country_origin: "USA")
  5.times do |index|
    product.reviews.create!(author: Faker::Superhero.name, content_body: Faker::ChuckNorris.fact, rating: Faker::Number.between(1, 5))
  end
end

25.times do |index|
  product = Product.create!(name: Faker::Food.unique.ingredient, image: "http://www.fillmurray.com/200/300", cost: Faker::Commerce.price, country_origin: "Canada")
  5.times do |index|
    product.reviews.create!(author: Faker::Superhero.name, content_body: Faker::ChuckNorris.fact, rating: Faker::Number.between(1, 5))
  end
end

p "Created #{Product.count} products"

p "Created #{Review.count} reviews"
