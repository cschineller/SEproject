class ReviewsController < ApplicationController
  before_action :user_signed_in?

  def create
    if Product.where(params[:id].to_i).exists?()
      @review = Review.new(review_params)
      @review.product = Product.find(params[:id])
      @review.user = current_user
      respond_to do |format|
        if @review.save
          format.html { redirect_to product_path, notice: "Review posted!" }
          format.js
        else
          redirect_to(product_path, alert: "Failed to save review") and return
        end
      end
    else
      redirect_to(product_path, alert: "Failed to save review") and return
    end
  end

  private

  def review_params
    params.require(:review).permit(:stars, :review)
  end
end
