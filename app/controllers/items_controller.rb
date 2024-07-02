class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new]
  def index
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
  
  
  private

  def item_params
    params.require(:item).permit(:title, :content, :category_id, :items_status_id, :delivery_price_id, :prefecture_id, :delivery_date_id, :items_price, :image).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
    
end