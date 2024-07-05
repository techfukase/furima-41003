class OrdersController < ApplicationController
  before_action :item_find, only: :index

  def index
    @order = Order.new
    @address = Address.new
  end

  private

  def item_find
    @item = Item.find(params[:item_id])
  end  
end