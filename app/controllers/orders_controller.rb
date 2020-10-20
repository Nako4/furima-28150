class OrdersController < ApplicationController
  before_action :redirect_root

  def index
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
    redirect_to root_path if current_user.id == @item.user_id
    redirect_to root_path if @item.order.item_id != nil
  end

  def new
  end

  def create
    @price = Item.find(params[:item_id]).price
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postal_code, :consignor_id, :city, :addresses, :building, :phone_number, :user_id, :item_id, :token).merge(user_id: current_user.id, price: @price)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @price,
      card: order_params[:token],
      currency:'jpy'
    )
 end

 def redirect_root
  redirect_to root_path unless user_signed_in?
 end

end
