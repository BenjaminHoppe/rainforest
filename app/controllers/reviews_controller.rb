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
    @product = Product.find(params[:product_id])
    @review.product = @product
  end

  def update
    @review = Review.find(params[:id])
    @product = Product.find(params[:product_id])
    @review.body = params[:review][:body]
    @review.product = @product

    if @review.save
      redirect_to product_path(@product)
    else
      render edit_product_review_path
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    @product = Product.find(params[:id])
    redirect_to "/products/#{@product.id}"
  end
end
