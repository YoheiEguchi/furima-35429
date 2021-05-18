FactoryBot.define do
  factory :user do
    nickname { '太郎' }
    email { Faker::Internet.free_email }
    password { 'aaa000' }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth { Faker::Date.birthday }
  end
end
