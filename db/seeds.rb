# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do
  Obituary.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: Faker::Number(within(range: 45..110)),
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    image_url: Faker::LoremFlicker.image(size: "50x60", search_terms: ['nature'])
  )
end 
