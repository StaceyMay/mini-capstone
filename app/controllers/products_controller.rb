class ProductsController < ApplicationController

  def view_products
    @products = Product.all
  end

def float_of_2_decimal(float_n) 
  float_n.to_d.round(2, :truncate).to_f
end

end
