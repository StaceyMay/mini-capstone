class ProductsController < ApplicationController

  def view_products
    @products = Product.all
  end

# def taxed
#   @taxed = Product.price * 1.1
# end

end
