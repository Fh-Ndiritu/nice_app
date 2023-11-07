FactoryBot.define do
  factory :store do
    name { Faker::TvShows::GameOfThrones.house }
  end
end
