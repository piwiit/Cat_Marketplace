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


10.times do
  
    User.create(
      firstname: Faker::Name.first_name,
      lastname: Faker::Name.last_name,
      email: Faker::Internet.email(domain: 'yopmail'),
      age: rand(13..99),
      password: 'azerty',
      password_confirmation: 'azerty',
      is_admin: false
    )
end

10.times do 
  Cart.create(user_id: User.ids.sample) 
end

10.times do
    Order.create(
      reception_email: Faker::Internet.email(domain: 'yopmail'),
      total_price: rand(5..1000),
      cart_id: Cart.ids.sample
    )
end



10.times do
  Category.create(name: categories_names.sample) 
end

10.times do
    Artwork.create(
      title: Faker::Book.title,
      price: Faker::Number.decimal(l_digits: 3, r_digits: 2),
      description:
        Faker::Lorem.sentence(
          word_count: 10, supplemental: true, random_words_to_add: 5
        ),
      category_id: Category.ids.sample,
      quantity: Faker::Number.number(digits: 3)
    )
end

10.times do
   JoinArtCart.create(cart_id: Cart.ids.sample, artwork_id: Artwork.ids.sample)
end
