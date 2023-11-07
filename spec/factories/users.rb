FactoryBot.define do
  factory :user do
    store
    email {Faker::Internet.email}
    password {'NiceApp123'}
  end
end
