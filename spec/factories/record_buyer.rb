FactoryBot.define do
  factory :record_buyer do
    
    association :user
    association :item
    association :record

    post_code {'123-4567'}
    shipping_area_id {2}
    city {'テスト市'}
    address {'テスト番地'}
    building {'テスト建物'}
    tel {'09012345678'}
  end
end