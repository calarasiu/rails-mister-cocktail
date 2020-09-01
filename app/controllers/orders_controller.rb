class OrdersController < ApplicationController
  def index 
    @orders = current_user.orders 
  end 

  def show 
    @order = Order.find(params[:id])
  end 
  

  def create 
    @cocktail = Cocktail.find(params[:cocktail_id])
    @order = Order.new(order_params)
    @order.cocktail = @cocktail
    @comment.user = current_user
    if order.save 
      redirect_to cocktails_path
    else  
      flash[:notice] = "table column cannot be left blank"
    end 
  end 

  private

  def order_params
    params.require(@order).permit(:table_number)
  end 
end
