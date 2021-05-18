class Buyer < ApplicationRecord
  belongs_to :record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_area
end
