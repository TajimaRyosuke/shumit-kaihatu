# FactoryBot.define do
#   factory :user, class: User do
#     email {'test@test.com'}
#     password {'password'}
#     encrypted_password {'password'}
#     name { Faker::Lorem.characters(number: 5) }
#   end
#   factory :user2, class: User do
#     email {'test2@test.com'}
#     password { '123456' }
#     encrypted_password { '123456' }
#     name { Faker::Lorem.characters(number: 5) }
#   end
# end
  FactoryBot.define do
    factory :user do
      name { Faker::Lorem.characters(number: 10) }
      email { Faker::Internet.email }
      introduction { Faker::Lorem.characters(number: 20) }
      password { 'password' }
    end
  end
