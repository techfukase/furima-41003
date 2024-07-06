class OrdersController < ApplicationController
  before_action :item_find, only: :index

  def index
    @order = Order.new
    @address = Address.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.create(order_params)
    @address = Address.create(address_params)

    if @order.save && @address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end
  
  def address_params
    params.permit(:post_number, :prefecture_id, :city, :number, :building, :phone_number).merge(order_id: @order.id)
  end
end