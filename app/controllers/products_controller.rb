class ProductsController < ApplicationController
  def view_products
    @view_products = Product.all
  end
  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def new
  end

  def create
    @product = Product.new(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    @product.save

    flash[:success] = "You have created your item!"
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    product = Product.find_by(id: params[:id])
    product.assign_attributes(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    product.save

    flash[:info] =  "You have updated your item!"

    redirect_to "/products/#{product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy

    redirect_to "/products"

    flash[:danger] = "You have deleted the item!"
  end

end
