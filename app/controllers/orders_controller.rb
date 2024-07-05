class OrdersController < ApplicationController
  def index
    @order = Order.item.all
  end
end