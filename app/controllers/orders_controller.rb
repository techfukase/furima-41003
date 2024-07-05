class OrdersController < ApplicationController
  def index
    @order = Order.new
    @address = Address.new
  end
end