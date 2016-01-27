class ReviewsController < ApplicationController
  

  def index

  end

  def show
    if params[:id]
      @yelp = Yelp.client.business(params[:id])
    end
  end

  def create
    session[:return_to] ||= request.referer
    @review = current_user.reviews.create(review_params)
    redirect_to session.delete(:return_to)
  end

  private
  def review_params
    params.require(:review).permit(:comment,:score,:location_id,:parking_score,:entrance_score,:table_score,:bathroom_score)
  end

end
