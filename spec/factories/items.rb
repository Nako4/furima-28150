FactoryBot.define do
  factory :item do

    name                { Faker::Name.initials(number: 2) }
    text                { "3" }
    category_id         { "2" }
    condition_id        { "2" }
    who_pays_fare_id    { "2" }
    consignor_id        { "2" }
    when_ship_id        { "2" }
    price               { 4000 }
    user_id             { "2" }
    
  end
end
