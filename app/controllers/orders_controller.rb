class OrdersController < ApplicationController

  def new
  end

  def create
  @products = current_user.carted_products.where("status LIKE ?", "carted")
  @order = Order.new(user_id: current_user.id)
  @products.each do |product|
    @order.subtotal = product.product.price * product.quantity
  end
  @order.tax = @order.subtotal * 0.09
  @order.total = @order.subtotal + @order.tax

  @order.save

  @products.update_all(status: "purchased", order_id: @order.id)

  # flash[:success] = "You have submitted your order!"

  end



end
