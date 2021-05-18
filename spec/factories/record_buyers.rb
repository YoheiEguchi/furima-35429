FactoryBot.define do
  factory :record_buyer do
    post_code { '123-4567' }
    shipping_area_id { 2 }
    city { 'テスト市' }
    address { 'テスト番地' }
    building { 'テスト建物' }
    tel { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
