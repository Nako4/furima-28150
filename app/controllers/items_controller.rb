class ItemsController < ApplicationController
  def index
  end

  def new
  end

  private

  def item_params
    params.require(:item).premit(:content, image).merge(user_id: current_user.id)
    # itemを出品したuserとcurrent_userがmergeによって１まとめになっている。
  end
end
