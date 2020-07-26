FactoryBot.define do
  factory :obituary do
    association :user
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    age { Faker::Number.within(range: 45..110)}
    city { Faker::Address.city}
    state { Faker::Address.state_abbr }
    description { Faker::Lorem.paragraph(sentence_count: 10) }
  end
end
