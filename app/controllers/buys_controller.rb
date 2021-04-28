class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  
  def index
    @buy_shipping = BuyShipping.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    if @item.buy.present?
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_shipping = BuyShipping.new(buy_params)
    if @buy_shipping.valid?
      pay_item
      @buy_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_shipping).permit(:postal, :area_id, :city, :address, :build, :tel).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],
        card: buy_params[:token],
        currency: 'jpy'
      )
  end
end
