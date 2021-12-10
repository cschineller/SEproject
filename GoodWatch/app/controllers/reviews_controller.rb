class ReviewsController < ApplicationController
  before_action :user_signed_in?

  def show
    Review.new(params)
  end

  def create
    #if Show.find(params[:id]).exists?()
      showob = Show.find(params[:id])
      @review = Review.new()
      @review.review = params[:review]
      @review.stars = params[:stars]
      @review.show = showob
      @reviewauthor = ReviewAuthor.new()
      @reviewauthor.name = current_user.email
      @reviewauthor.user = current_user
      @review.review_author = @reviewauthor
      @reviewauthor.save
      respond_to do |format|
        if @review.save
          format.html { redirect_to show_path, notice: "Review posted!" }
          format.js {render inline: "location.reload();"}
        else
          redirect_to(show_path, alert: "Failed to save review") and return
        end
      end
    #else
      #redirect_to(show_path, alert: "Failed to save review") and return
    #end
  end

  private

  def review_params
    params.permit(:stars, :review)
  end
end
