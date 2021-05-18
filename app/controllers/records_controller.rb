class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :user_checked

  def index
    @record_buyer = RecordBuyer.new
  end

  def create
    @record_buyer = RecordBuyer.new(record_buyer_params)
    if @record_buyer.valid?
      pay_item
      @record_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def record_buyer_params
    params.require(:record_buyer).permit(:post_code, :shipping_area_id, :city, :address, :building, :tel)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: record_buyer_params[:token],
      currency: 'jpy'
    )
  end

  def user_checked
    redirect_to root_path if current_user.id == @item.user_id || @item.record.present?
  end
end
