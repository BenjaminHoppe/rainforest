class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @product = Product.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new
    @review.body = params[:review][:body]
    @review.product_id = params[:review][:product_id]
    @product = Product.find(params[:id])

    if @review.save
      redirect_to "/products/#{@product.id}"
    else
      render :new
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
