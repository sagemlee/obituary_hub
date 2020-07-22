FactoryBot.define do
  factory :obituary do
    first_name { "MyString" }
    last_name { "MyString" }
    age { 1 }
    city { "MyString" }
    state { "MyString" }
    description { "MyString" }
    image_url { "https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg" }
    user
  end
end
