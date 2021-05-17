class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string     :post_code,        null: false
      t.integer    :shipping_area_id, null: false
      t.string     :city,             null: false
      t.string     :address,          null: false
      t.string     :building
      t.string     :tel,              null: false
      t.references :record,           foreign_key: true
      t.timestamps
    end
  end
end
