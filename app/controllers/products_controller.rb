class ProductsController < ApplicationController
  def index
    @products = Product.all
    # @products = Product.where(nil)
    # @products = @products.alphabetical if request.original_fullpath == "/products.name"
    # @products = @products.creation if request.original_fullpath == "/products.created_at"
    # @products = @products.most_reviews if request.original_fullpath == "/products.reviews"
  end

  def list
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
    flash[:notice] = "Product successfully added!"
      redirect_to  products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully updated!"
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = "Product successfully removed!"
      redirect_to products_path
    end
  end

private
  def product_params
    params.require(:product).permit(:name, :country_origin, :image)
  end
end
