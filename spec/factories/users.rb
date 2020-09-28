FactoryBot.define do
  factory :user do

    nickname               { Faker::Name.initials(number: 2) }
    email                  { Faker::Internet.free_email }
    password               { Faker::Internet.password(min_length: 6, max_length: 48) }
    password_confirmation  { password }
    first_kanji            { '山田' }
    last_kanji             { '太郎' }
    first_katakana         { 'ヤマダ' }
    last_katakana          { 'タロウ' }
    birthday               { '19910921' }
  end
end
