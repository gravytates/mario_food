class ProductsController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    if params[:sort_by] == nil
      @products = Product.alphabetical
    else
      @products = Product.send(params[:sort_by])
      if Product.send(params[:sort_by]) == []
        flash[:alert] = "No results returned.  Choose another filter!"
      end
    end
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
