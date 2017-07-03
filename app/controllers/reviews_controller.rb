class ReviewsController < ApplicationController
  before_action :authorize, only: [:new, :create]

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(reviews_params)
    if @review.save
      flash[:notice] = "Review successfully added!"
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private
    def reviews_params
      output = params.require(:review).permit(:author, :content_body, :rating)
    end

end
