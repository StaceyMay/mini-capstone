class ProductsController < ApplicationController

  def view_products
    @products = Product.all
  end

end
