class CartedProductsController < ApplicationController

  def create
      @cartedproduct = CartedProduct.new(user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity].to_i, status: "carted")
      @cartedproduct.save

      redirect_to "/cartedproducts/checkout"
  end


  def checkout
    @cartedproducts = current_user.carted_products.where("status LIKE ?", "carted")
    if @cartedproducts.empty?
      redirect_to "/products"
      flash[:danger] = "You have no items in your cart!"
    end
  end

  def destroy
      # @cp = current_user.carted_products.where("status LIKE ?", "carted")
      # @cp.destroy

      # redirect_to "/cartedproducts/checkout"

      @cartedproduct = CartedProduct.find_by(id: params[:id])
      @cartedproduct.assign_attributes(status: "removed")
      @cartedproduct.save

      flash[:success] = "Product Removed From Cart"

      redirect_to "/cartedproducts/checkout"
  end

  
end
