FactoryBot.define do
  factory :item do
    association :user

    item_name { 'テスト' }
    item_text { 'テスト' }
    category_id { 2 }
    condition_id { 2 }
    shipping_charge_id { 2 }
    shipping_area_id { 2 }
    day_to_ship_id { 2 }
    price { 1000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
