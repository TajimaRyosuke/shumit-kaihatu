FactoryBot.define do
  factory :post do
    post_title { Faker::Lorem.characters(number: 10) }
    opinion { Faker::Lorem.characters(number: 50) }
    post_image_id {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/Rails.jpg'), 'image/jpg')}
  end
end
