class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :current_user_admin, only: [:new, :edit, :create, :update, :destroy] 
  

  def view_products
    @view_products = Product.all
  end

  def index


    sort_column = params[:order]
    @products = Product.all.order(sort_column)
    if sort_column == "price_high"
      @products = Product.all.order(price: :desc)
    elsif
      sort_column == "price_low"
      @products = Product.all.order(price: :asc)
    elsif sort_column == "name"
      @products = Product.all.order(name: :asc)
    elsif params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    elsif
      @products = Product.all
    end

    discount_items = params[:discount]
     if discount_items ==  "two"
        @products = Product.where("price < ?", 2)
    end


    #session
    if session[:count] == nil
      session[:count] =1
    else 
      session[:count] += 1
    end

    @session_counter = session[:count]
  end

  def show

    random_item = params[:id]
      if random_item == "random"
        @product =Product.order("RANDOM()").first
      else
        @product = Product.find_by(id: params[:id])
      end

      @supplier = Supplier.find_by(id: @product.supplier_id)
  end

  def new
    @product = Product.new
  end

  def search
    @search_term = params[:search]
    @products = Product.where("name LIKE ?", "%#{@search_term}%")

    render :index
  end


  def create
    @product = Product.new(name: params[:name], price: params[:price], image: params[:image], description: params[:description], supplier_id: params[:supplier_id][:supplier_id] )
    if @product.save
      flash[:success] = "You have created your item!"
    else
      render :new
    end

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
