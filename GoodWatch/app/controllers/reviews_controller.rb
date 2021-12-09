class ReviewsController < ApplicationController
  before_action :user_signed_in?

  def show
    Review.new(params)
  end

  def create
    if Show.where(params[:id]).exists?()
      @review = Review.new(review_params)
      @review.show = Show.find(params[:id])
      @review.review_author_id = current_user
      respond_to do |format|
        if @review.save
          format.html { redirect_to show_path, notice: "Review posted!" }
          format.js
        else
          redirect_to(show_path, alert: "Failed to save review") and return
        end
      end
    else
      redirect_to(show_path, alert: "Failed to save review") and return
    end
  end

  private

  def review_params
    params.permit(:stars, :review)
  end
end
