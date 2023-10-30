FactoryBot.define do
  factory :car do
    model { "MyString" }
    brand { "MyString" }
    power { 1 }
    color { "MyString" }
    seat_capacity { 1 }
    description { "MyText" }
    price { 1 }
    location { "MyString" }
  end
end
