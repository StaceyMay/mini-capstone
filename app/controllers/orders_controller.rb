class OrdersController < ApplicationController

  def new
  end

  def create
  @product = Product.find_by(id: params[:product_id])
  @order = Order.new(user_id: current_user.id, product_id: @product.id, quantity: params[:quantity])
  @order.subtotal = @product.price * @order.quantity
  @order.tax = @order.subtotal * 0.09
  @order.total = @order.subtotal + @order.tax


  @order.save

  flash[:success]= "You have added to cart!"

  end

end
