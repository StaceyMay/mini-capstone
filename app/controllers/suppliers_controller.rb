class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @supplier = Supplier.find_by(name: params[:name])
  end

end
