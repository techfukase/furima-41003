FactoryBot.define do
  factory :order_address do
    token          { "tok_#{Faker::Alphanumeric.alphanumeric(number: 24)}" }
    user_id        { Faker::Number.unique.between(from: 1, to: 100) }
    item_id        { Faker::Number.unique.between(from: 1, to: 100) }
    post_number    { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    city           { Faker::Address.city }
    number         { Faker::Address.street_address }
    building       { Faker::Address.secondary_address }
    phone_number   { Faker::Number.leading_zero_number(digits: 11) }
  end
end
