class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find, only: [:index, :create]
  before_action :moved_top_page, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)

    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def moved_top_page
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
  
  def order_params
    params.require(:order_address).permit(:post_number, :prefecture_id, :city, :number, :building,
                                          :phone_number).merge(user_id: current_user.id, item_id: @item.id,
                                          token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.items_price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end