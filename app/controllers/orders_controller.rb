class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
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

end
