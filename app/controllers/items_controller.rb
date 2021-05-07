class ItemsController < ApplicationController
before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  def item_params
    params.require(:item).permit(:item_name, :item_text, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :day_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

end
