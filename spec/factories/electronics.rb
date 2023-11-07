FactoryBot.define do
  factory :electronic do
    name { Faker::Appliance.equipment }
    price { 20 }
  end
end
