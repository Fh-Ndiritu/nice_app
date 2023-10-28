FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password {'NiceApp123'}
  end
end
