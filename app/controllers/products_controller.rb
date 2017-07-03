class ProductsController < ApplicationController
  before_action :authorize, only: [:new, :create]

  def index
    @products = Product.where(nil)
    @products = @products.alphabetical if request.original_fullpath == "/products.name"
    @products = @products.high_price if request.original_fullpath == "/products.spendy"
    @products = @products.low_price if request.original_fullpath == "/products.cheap"
    @products = @products.recent if request.original_fullpath == "/products.recent"
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
    params.require(:product).permit(:name, :country_origin, :cost, :image)
  end
end
