class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Items.new
  end

  def create
    @item = Item.create(item_params)
    redirect_to root_path
  end
  
  
  private

  def item_params
    params.require(:item).permit(:title, :content, :category_id, :items_status_id, :delivery_price_id, :prefecture_id, :delivery_date_id, :items_price, :image).merge(user_id: current_user.id)
  end  
end