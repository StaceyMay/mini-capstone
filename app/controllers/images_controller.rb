class ImagesController < ApplicationController

  def new
  end

  def create
    image = Image.new(image_1: params[:image_1], product_id: params[:products][:product_id])
    image.save

    redirect_to "/products/#{params[:products][:product_id]}"
  end

end
