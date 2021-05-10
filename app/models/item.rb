class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name, length: { maximum: 40 }
    validates :item_text, length: { maximum: 1000 }
    validates :price, format: { with: /\A[0-9]+\z/}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :shipping_charge_id
      validates :shipping_area_id
      validates :day_to_ship_id
    end
  end
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :day_to_ship

end
