class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.includes(:user).order(created_at: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  
  private

  def item_params
    params.require(:item).permit(:title, :content, :category_id, :items_status_id, :delivery_price_id, :prefecture_id, :delivery_date_id, :items_price, :image).merge(user_id: current_user.id)
  end
    
end