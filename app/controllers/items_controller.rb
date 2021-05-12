class ItemsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :edit]
before_action :user_checked, only: [:edit, :update]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def user_checked
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_text, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :day_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

end
