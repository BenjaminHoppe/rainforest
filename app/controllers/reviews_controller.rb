class ReviewsController < ApplicationController

  def create
    @review = Review.new
    @review.body = params[:review][:body]
    @product = Product.find(params[:product_id])
    @review.product_id =  @product.id
    @reviews = @product.reviews

    if @review.save
      redirect_to product_path(@product)
    else
      render 'products/show'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.body = params[:review][:body]
    @review.product_id = params[:review][:product_id]
    @product = Product.find(params[:id])

    if @review.save
      redirect_to "/products/#{@product.id}"
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    @product = Product.find(params[:id])
    redirect_to "/products/#{@product.id}"
  end
end
