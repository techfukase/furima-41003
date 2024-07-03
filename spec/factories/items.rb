FactoryBot.define do
  factory :item do
    title                 { Faker::Commerce.product_name }
    content               { Faker::Lorem.sentence }
    category_id           { Faker::Number.between(from: 2, to: 10) }
    items_status_id       { Faker::Number.between(from: 2, to: 6) }
    delivery_price_id     { Faker::Number.between(from: 2, to: 5) }
    prefecture_id         { Faker::Number.between(from: 2, to: 48) }
    delivery_date_id      { Faker::Number.between(from: 2, to: 4) }
    items_price           { Faker::Number.between(from: 300, to: 9999999) }
    association           :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end    
  end
end
