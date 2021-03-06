class LocationsController < ApplicationController

  def index
    if params[:name]
      @yelp = Yelp.client.search(params[:name], { term: 'food' })
    end

  end

  def show
    @review = Review.new
    @reviews = Review.all.where(location_id: params[:id])

    if @reviews.count > 0
      @score = (@reviews.sum("parking_score") + @reviews.sum("entrance_score") + @reviews.sum("table_score") +  @reviews.sum("bathroom_score"))/@reviews.all.count
      @parking_score = (@reviews.sum("parking_score"))/@reviews.all.count
      @entrance_score = (@reviews.sum("entrance_score"))/@reviews.all.count
      @bathroom_score = (@reviews.sum("bathroom_score"))/@reviews.all.count
      @table_score = (@reviews.sum("table_score"))/@reviews.all.count

    end
    if params[:id]
      @yelp = Yelp.client.business(params[:id])
    end
  end

  def create

  end

  def about
  end

  def terms
  end
  private


end
