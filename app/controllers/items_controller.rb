class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
    # itemを出品したuserとcurrent_userがmergeによって１まとめになっている。
    # itemの中にあるimageがストロングパラメーターとして送信していいよっていう状態。
  end
end
