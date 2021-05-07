class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name
    validates :item_text
    validates :category_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :day_to_ship_id
    validates :price
    validates :image
  end
  
  belongs_to :user
  has_one_attached :image
  
end
