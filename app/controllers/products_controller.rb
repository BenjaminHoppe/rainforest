class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
        @review = Review.new
        @reviews = @product.reviews.reverse
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new

        @product.name = params[:product][:name]
        @product.description = params[:product][:description]
        @product.price = params[:product][:price]

        if @product.save
            redirect_to "/products"
            flash[:notice] = "Product was successfully created."
        else
            render :new
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])

        @product.name = params[:product][:name]
        @product.description = params[:product][:description]
        @product.price = params[:product][:price]

        if @product.save
            redirect_to "/products/#{@product.id}"
            flash[:notice] = "Product was successfully updated."

        else
            render :edit
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to"/products"
        flash[:notice] = "Product was successfully deleted."
    end
end
