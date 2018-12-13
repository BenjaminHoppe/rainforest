class ReviewsController < ApplicationController
  before_action :load_review, only: [:show, :edit, :update, :destroy]
  before_action :ensure_logged_in, except: [:show, :index]
  before_action :ensure_user_owns_review, only: [:edit, :update, :destroy]

  def load_review
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new
    @review.body = params[:review][:body]
    @product = Product.find(params[:product_id])
    @review.product_id =  @product.id
    @reviews = @product.reviews

    @review.user_id = current_user.id

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
    @product = Product.find(params[:product_id])
    @review.product = @product
    @review.destroy
    redirect_to product_path(@product)
  end
end
