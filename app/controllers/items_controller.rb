class ItemsController < ApplicationController
before_action :basic_auth
before_action :authenticate_user!, only: [:new, :create]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

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
