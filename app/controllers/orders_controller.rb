class OrdersController < ApplicationController
  before_action :redirect_root
  before_action :item_set, only: [:index, :create]
  before_action :authenticate, only: [:index]

  def index
    @user_order = UserOrder.new
    redirect_to root_path if current_user.id == @item.user_id
    redirect_to root_path unless @item.order.nil?
  end

  def create
    @price = @item.price
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(
      :postal_code, :consignor_id, :city, :addresses, :building, :phone_number, :user_id, :item_id, :token
    ).merge(user_id: current_user.id, price: @price, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end

  def item_set
    @item = Item.find(params[:item_id])
  end
end
