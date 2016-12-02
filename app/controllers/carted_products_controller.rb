class CartedProductsController < ApplicationController

  def create
      @cartedproduct = CartedProduct.new(user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], status: "carted")
      @cartedproduct.save
  end


  def checkout
    @cartedproducts = current_user.carted_products.where("status LIKE ?", "carted")


  end

  
end
