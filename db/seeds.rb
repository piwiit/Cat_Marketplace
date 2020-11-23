# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Order.destroy_all
Artwork.destroy_all
Cart.destroy_all
Category.destroy_all
JoinArtCart.destroy_all

users = []
orders = []
artworks = []
carts = []
categories_names = [
  'Classic',
  'Epic',
  'Fairy tale',
  'Fantasy',
  'Horror',
  'Humor',
  'Legend',
  'Mystery',
  'Mythology',
  'Romance',
  'Travel',
  'Superhero'
]
categories = []

10.times do
  users <<
    User.create(
      firstname: Faker::Name.first_name,
      lastname: Faker::Name.last_name,
      email: Faker::Internet.email(domain: 'yopmail'),
      description:
        Faker::Lorem.sentence(
          word_count: 10, supplemental: true, random_words_to_add: 5
        ),
      age: rand(18..99),
      password: 'azerty',
      password_confirmation: 'azerty'
    )
end

10.times { carts << Cart.create(user: users.sample, Is_archived: false) }

10.times do
  orders <<
    Order.create(
      reception_email: Faker::Internet.email(domain: 'yopmail'),
      total_price: rand(5..1000),
      cart: carts.sample
    )
end
10.times { categories << Category.create(name: categories_names.sample) }

10.times do
  artworks <<
    Artwork.create(
      title: Faker::Book.title,
      price: Faker::Number.decimal(l_digits: 3, r_digits: 2),
      description:
        Faker::Lorem.sentence(
          word_count: 10, supplemental: true, random_words_to_add: 5
        ),
      category: categories.sample
    )
end

10.times { JoinArtCart.create(cart: carts.sample, artwork: artworks.sample) }
