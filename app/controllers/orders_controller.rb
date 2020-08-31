class OrdersController < ApplicationController
  def index 
    @orders = current_user.orders 
  end 

  def show 
    @order = Order.find(params[:id])
  end 

  def create 
    @user = current_user
    @cocktail = Cocktail.find(params[:cocktail_id])
    @order = Order.new(order_params)
    if order.save 
      redirect_to @order_path
  end 
end
