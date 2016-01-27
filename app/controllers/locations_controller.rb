class LocationsController < ApplicationController

  def index
    if params[:name]
      @yelp = Yelp.client.search(params[:name], { term: 'food' })
    end

  end

  def show
    @review = Review.new
    @reviews = Review.all.where(location_id: params[:id])
    @score = (@reviews.sum("parking_score", "entrance_score") + @reviews.sum("entrance_score") + @reviews.sum("table_score") + @reviews.sum("bathroom_score"))/@reviews.all.count
    if params[:id]
      @yelp = Yelp.client.business(params[:id])
    end
  end

  def create

  end

  private


end
