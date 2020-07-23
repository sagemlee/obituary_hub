FactoryBot.define do
  factory :obituary do
    first_name { "MyString" }
    last_name { "MyString" }
    age { 1 }
    city { "MyString" }
    state { "MyString" }
    description { "MyString" }
    user
  end
end
