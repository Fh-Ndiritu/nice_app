FactoryBot.define do
  factory :user do
    store
    email {Faker::Internet.email}
    password {'123456'}
    user_name { Faker::TvShows::GameOfThrones.character}
  end
end
