class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  #出品者でないユーザーがアクセスした時にトップページに遷移
  before_action :restriction, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :text, :category_id, :condition_id, :who_pays_fare_id, :consignor_id, :when_ship_id, :price, :user_id
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def restriction
    # redirect_to root_path if current_user.id != params[:id].to_i
    redirect_to root_path if current_user.id != @item.user_id.to_i
  end
end
