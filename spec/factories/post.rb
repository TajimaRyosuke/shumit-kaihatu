FactoryBot.define do
  factory :post do
    post_title { Faker::Lorem.characters(number: 10) }
    opinion { Faker::Lorem.characters(number: 50) }
  end
end
