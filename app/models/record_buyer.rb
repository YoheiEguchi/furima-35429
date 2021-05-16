class RecordBuyer

  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :city, :address, :building, :tel, :user_id, :item_id

  with_options presence: true do
    validates :post_code,        format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :tel,              format: { with: /\A[0-9]+\z/}
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :user_id
    validates :item_id
  end

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Buyer.create(post_code: post_code, shipping_area_id: shipping_area_id, city: city, address: address, building: building, tel: tel, record_id: record.id)
  end
end