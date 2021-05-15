class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @record_buyer = RecordBuyer.new
  end

  def create
    @record_buyer = RecordBuyer.new(record_buyer_params)
    if @record_buyer.valid?
      @record_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def record_buyer_params
    params.require(:record_buyer).permit(:post_code, :shipping_area_id, :city, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
