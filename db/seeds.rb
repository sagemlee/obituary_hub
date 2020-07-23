# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "example@email.com",
    password: "password_digest"
  })

100.times do
  Obituary.create!({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: Faker::Number.within(range: 45..110),
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    description: Faker::Lorem.paragraph(sentence_count: 10),
    image_url: Faker::Fillmurray.unique.image,
    user_id: user.id
  })
end
